/* ══════════════════════════════════════════════════════════════════════════
   اسلایدر سه‌بعدی با تعامل ماوس — فروشگاه خرازی پرنسا
   ──────────────────────────────────────────────────────────────────────────
   فایل: public/frontend/js/kharazi-slider.js

   ── این اسکریپت چه می‌کند؟ ───────────────────────────────────────────
   ۱) هنگام «نگه‌داشتن ماوس» روی اسلایدر:
        • کلاس `kp-3d` به بخش اسلایدر اضافه می‌شود و اسلایدها عمق
          می‌گیرند (چرخش ملایم حول محور Y + کوچک‌شدن اسلایدهای کنار).
        • حرکت ماوس روی اسلایدر، زاویه دید را به‌آرامی تغییر می‌دهد
          (Parallax سه‌بعدی) — با محدودسازی زاویه تا حدی که خوانایی
          حفظ شود.

   ۲) هنگام «اسکرول کردن با چرخ ماوس» روی اسلایدر:
        • چرخ ماوس به‌جای اسکرول صفحه، اسلاید بعد/قبلی را می‌برد.
        • رفتار با debounce کنترل می‌شود تا یک چرخ ماوس، چند اسلاید
          را رد نکند.
        • پس از توقف چرخ ماوس، پیمایش صفحه آزاد می‌شود تا کاربر در
          اسلایدر «گیر نکند».

   ── اصول طراحی (چرا این‌گونه نوشته شده؟) ─────────────────────────────
   • بدون وابستگی بیرونی: فقط DOM خالص. jQuery یا کتابخانه کمکی لازم
     نیست. (Slick که از قبل در پروژه هست، فقط برای «رفتن به اسلاید
     بعدی/قبلی» صدا زده می‌شود و اگر نبود، اسکریپت بی‌صدا کنار می‌رود.)
   • اگر هیچ اسلایدری در صفحه نباشد، اسکریپت هیچ کاری نمی‌کند —
     بنابراین در صفحاتی مثل سبد خرید یا ورود، هزینه‌ای ندارد.
   • سازگار با موبایل و تبلت: چون در دستگاه‌های لمسی «ماوس» معنا
     ندارد، روی صفحه‌های لمسی اسکریپت غیرفعال می‌ماند و کاربر با
     کشیدن انگشت (رفتار پیش‌فرض Slick) اسلاید را عوض می‌کند. این کار
     مانع پیمایش عادی صفحه در موبایل می‌شود.
   • احترام به `prefers-reduced-motion`: اگر کاربر در سیستم خود
     «کاهش حرکت» را فعال کرده باشد، افکت‌های سه‌بعدی خاموش می‌شوند.
   ══════════════════════════════════════════════════════════════════════════ */
(function () {
    'use strict';

    /* ───────────── تنظیمات قابل تغییر ───────────── */
    var CFG = {
        // بیشینه چرخش اسلایدهای کناری (درجه). بیش از این، خوانایی می‌افتد.
        sideRotateDeg: 9,
        // بیشینه چرخش اسلاید جاری هنگام حرکت ماوس (درجه)
        tiltMaxDeg: 5,
        // فاصله عمق اسلایدهای کناری (پیکسل)
        sideDepthPx: 70,
        // آستانه چرخ ماوس برای تغییر اسلاید (واحد deltaY)
        wheelThreshold: 26,
        // فاصله زمانی حداقلی بین دو تغییر اسلاید (میلی‌ثانیه)
        wheelCooldownMs: 550,
        // پس از این مدت بی‌حرکتیِ چرخ ماوس، پیمایش صفحه آزاد می‌شود
        idleReleaseMs: 420
    };

    /* ───────────── تشخیص قابلیت‌های دستگاه ───────────── */
    var reduceMotion = window.matchMedia &&
        window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    // در دستگاه لمسی، تعامل «نگه‌داشتن ماوس» معنا ندارد.
    function isTouchOnly() {
        return window.matchMedia &&
            window.matchMedia('(hover: none)').matches &&
            window.matchMedia('(pointer: coarse)').matches;
    }

    /* ───────────── راه‌اندازی یک اسلایدر ───────────── */
    function initSlider(root) {
        if (!root || root.dataset.kp3dBound === '1') return;
        root.dataset.kp3dBound = '1';

        var tiltTargets = collectTiltTargets(root);

        /* ═══ بخش ۱: نگه‌داشتن ماوس → فعال‌سازی عمق سه‌بعدی ═══ */
        if (!isTouchOnly()) {
            var holdTimer = null;
            var isHeld = false;

            var holdDelay = 140; // تا این مدت، نگه‌داشتن محسوب نمی‌شود

            var onEnter = function () {
                holdTimer = window.setTimeout(function () {
                    isHeld = true;
                    root.classList.add('kp-3d');
                }, holdDelay);
            };

            var onLeave = function () {
                if (holdTimer) { window.clearTimeout(holdTimer); holdTimer = null; }
                isHeld = false;
                root.classList.remove('kp-3d');
                resetTilt(tiltTargets);
            };

            root.addEventListener('mouseenter', onEnter);
            root.addEventListener('mouseleave', onLeave);

            /* ═══ بخش ۲: حرکت ماوس → تمایل (tilt) سه‌بعدی ═══ */
            root.addEventListener('mousemove', function (e) {
                if (!isHeld || reduceMotion) return;

                // موقعیت ماوس نسبت به مرکز اسلایدر، در بازه −1..1
                var rect = root.getBoundingClientRect();
                if (!rect.width || !rect.height) return;

                var nx = ((e.clientX - rect.left) / rect.width) * 2 - 1;
                var ny = ((e.clientY - rect.top) / rect.height) * 2 - 1;

                // محدودسازی برای پرهیز از زاویه‌های تند
                nx = Math.max(-1, Math.min(1, nx));
                ny = Math.max(-1, Math.min(1, ny));

                var rotY = (-nx * CFG.tiltMaxDeg).toFixed(2);
                var rotX = (ny * CFG.tiltMaxDeg * 0.6).toFixed(2);

                tiltTargets.forEach(function (el) {
                    el.style.transform =
                        'perspective(1400px) rotateX(' + rotX + 'deg) rotateY(' +
                        rotY + 'deg) scale(1.012)';
                });
            });
        }

        /* ═══ بخش ۳: چرخ ماوس → تغییر اسلاید ═══ */
        if (!isTouchOnly()) {
            var lastSwitch = 0;
            var idleTimer = null;
            var wheelLocked = true; // تا اولین چرخ، پیمایش صفحه آزاد است

            var releaseScroll = function () {
                wheelLocked = false;
                if (idleTimer) { window.clearTimeout(idleTimer); idleTimer = null; }
            };

            root.addEventListener('wheel', function (e) {
                // اگر ماوس روی اسلایدر نیست یا اسلایدر تک‌اسلایدی است،
                // هیچ دخالتی در پیمایش صفحه نمی‌کنیم.
                if (!root.classList.contains('kp-3d')) return;

                var slides = countSlides(root);
                if (slides < 2) return;

                var delta = e.deltaY || 0;
                if (Math.abs(delta) < CFG.wheelThreshold) return;

                var now = Date.now();

                // در بازه cooldown، رویداد را می‌بلعیم تا پرش چند‌اسلایدی رخ ندهد
                if (now - lastSwitch < CFG.wheelCooldownMs) {
                    if (wheelLocked) e.preventDefault();
                    return;
                }

                // چرخ ماوس مصرف شد → پیمایش صفحه متوقف می‌شود
                wheelLocked = true;
                e.preventDefault();

                lastSwitch = now;
                gotoSlide(root, delta > 0 ? 'next' : 'prev');

                // پس از توقف چرخ، پیمایش صفحه آزاد شود
                if (idleTimer) window.clearTimeout(idleTimer);
                idleTimer = window.setTimeout(releaseScroll, CFG.idleReleaseMs);
            }, { passive: false });
        }

        /* ═══ بخش ۴: کلیدهای جهت‌دار برای دسترس‌پذیری ═══ */
        root.setAttribute('tabindex', root.getAttribute('tabindex') || '0');
        root.addEventListener('keydown', function (e) {
            if (e.key === 'ArrowLeft') { gotoSlide(root, 'next'); }
            else if (e.key === 'ArrowRight') { gotoSlide(root, 'prev'); }
        });
    }

    /* ───────────── توابع کمکی ───────────── */

    // هدف‌های تمایل: اسلاید جاری و ظرف لیست.
    function collectTiltTargets(root) {
        var out = [];
        var current = root.querySelector('.slick-current > div');
        if (current) out.push(current);
        var list = root.querySelector('.slick-list');
        if (list) out.push(list);
        if (!out.length) out.push(root);
        return out;
    }

    function resetTilt(targets) {
        targets.forEach(function (el) {
            el.style.transform = '';
        });
    }

    function countSlides(root) {
        return root.querySelectorAll('.slick-slide').length;
    }

    // فرمان رفتن به اسلاید بعد/قبلی. اگر Slick موجود باشد از API آن
    // استفاده می‌کنیم؛ در غیر این صورت خودِ دکمه پیمایش را می‌زنیم.
    function gotoSlide(root, dir) {
        try {
            if (window.jQuery && window.jQuery.fn && window.jQuery.fn.slick) {
                var $slider = window.jQuery(root).find('.slick-initialized').first();
                if (!$slider.length) $slider = window.jQuery(root).find('.slick-slider').first();
                if ($slider.length) {
                    if (dir === 'next') $slider.slick('slickNext');
                    else $slider.slick('slickPrev');
                    return;
                }
            }
        } catch (err) {
            // بی‌صدا: اگر Slick رفتار غیرمنتظره داشت، از مسیر جایگزین می‌رویم
        }

        var sel = dir === 'next' ? '.slick-next' : '.slick-prev';
        var btn = root.querySelector(sel);
        if (btn) btn.click();
    }

    /* ───────────── راه‌اندازی اولیه ───────────── */
    function boot() {
        if (isTouchOnly()) return; // در موبایل، کشیدن انگشت کافی است

        var roots = document.querySelectorAll(
            '.fullwidth-slider-section, .flash-deal-section .slick-slider'
        );
        for (var i = 0; i < roots.length; i++) {
            initSlider(roots[i]);
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', boot);
    } else {
        boot();
    }
})();

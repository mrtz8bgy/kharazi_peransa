#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ساخت تصاویر جایگزین و آیکون دسته‌بندی
======================================
این اسکریپت دو کار انجام می‌دهد:

۱) برای هر دسته‌بندی یک آیکون و یک بنر می‌سازد (۲۵۰×۲۵۰ و ۱۲۰۰×۴۰۰)
   با نام دسته و پالت رنگی برند (فیروزه‌ای #0f7b7b و مرجانی #ff6b52).

۲) برای محصولاتی که هنوز عکس واقعی ندارند، یک تصویر جایگزین تمیز
   با نام آن دسته می‌سازد تا هیچ تصویر شکسته‌ای در سایت نباشد.

شفافیت: این تصاویر «جایگزین» هستند نه «عکس واقعی محصول». بنابراین
روی هرکدام برچسب «تصویر نمونه» درج می‌شود تا با عکس واقعی محصول
اشتباه گرفته نشوند.
"""

import io
import os
import subprocess

from PIL import Image, ImageDraw, ImageFont
import arabic_reshaper
from bidi.algorithm import get_display

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'public')
FONT_R = '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf'
FONT_B = '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf'

TEAL = (15, 123, 123)
CORAL = (255, 107, 82)
BG = (247, 250, 251)
WHITE = (255, 255, 255)
GREY = (108, 124, 130)

# نگاشت شناسهٔ دسته → نام فارسی
CATEGORIES = {
    4: "نخ و سوزن",
    5: "گلدوزی و شماره‌دوزی",
    6: "روبان، دانتل و تور",
    7: "کاموا و بافتنی",
    8: "دکمه، زیپ و یراق",
    9: "قیچی و ابزار خیاطی",
    12: "منجوق، پولک و نگین",
    13: "پارچه",
    14: "چرخ خیاطی و قطعات",
    15: "کیف و سازماندهی لوازم",
}


def fa(text):
    """متن فارسی را برای رندر در PIL آماده می‌کند."""
    return get_display(arabic_reshaper.reshape(text))


def fit_font(draw, text, font_path, max_w, start=48, min_size=12):
    """بزرگ‌ترین اندازه قلم که متن در عرض داده‌شده جا شود."""
    size = start
    while size > min_size:
        f = ImageFont.truetype(font_path, size)
        bbox = draw.textbbox((0, 0), text, font=f)
        if bbox[2] - bbox[0] <= max_w:
            return f
        size -= 2
    return ImageFont.truetype(font_path, min_size)


def wrap_and_center(draw, text, font, max_w, max_h, color, cx, cy):
    """متن را در چند خط می‌شکند و وسط‌چین می‌کشد."""
    words = text.split()
    lines, cur = [], ''
    for w in words:
        trial = (cur + ' ' + w).strip()
        bbox = draw.textbbox((0, 0), trial, font=font)
        if bbox[2] - bbox[0] <= max_w or not cur:
            cur = trial
        else:
            lines.append(cur)
            cur = w
    if cur:
        lines.append(cur)

    lh = font.size + 10
    total = lh * len(lines)
    y = cy - total / 2
    for ln in lines:
        bbox = draw.textbbox((0, 0), ln, font=font)
        w = bbox[2] - bbox[0]
        if y + lh > cy + max_h / 2:
            break
        draw.text((cx - w / 2, y), ln, font=font, fill=color)
        y += lh


def make_category_icon(cid, name, path):
    """آیکون مربعی ۲۵۰×۲۵۰ برای دسته‌بندی."""
    S = 250
    im = Image.new('RGB', (S, S), WHITE)
    d = ImageDraw.Draw(im)
    # نوار رنگی بالای کارت
    d.rectangle([0, 0, S, 5], fill=TEAL)
    # دایره تزئینی
    d.ellipse([S / 2 - 78, S / 2 - 78, S / 2 + 78, S / 2 + 78], outline=TEAL, width=3)
    d.ellipse([S / 2 - 64, S / 2 - 64, S / 2 + 64, S / 2 + 64], outline=(200, 228, 228), width=2)

    txt = fa(name)
    f = fit_font(d, txt, FONT_B, S - 46, start=34, min_size=13)
    wrap_and_center(d, txt, f, S - 40, 150, TEAL, S / 2, S / 2)
    im.save(path, 'PNG', optimize=True)


def make_category_banner(cid, name, path):
    """بنر افقی ۱۲۰۰×۴۰۰ برای دسته‌بندی."""
    W, H = 1200, 400
    im = Image.new('RGB', (W, H), BG)
    d = ImageDraw.Draw(im)
    # گرادیان ساده
    for x in range(W):
        t = x / W
        r = int(BG[0] + (226 - BG[0]) * t)
        g = int(BG[1] + (242 - BG[1]) * t)
        b = int(BG[2] + (243 - BG[2]) * t)
        d.line([(x, 0), (x, H)], fill=(r, g, b))
    # شکل‌های تزئینی
    d.ellipse([W - 260, -90, W + 90, 260], fill=(214, 238, 238))
    d.ellipse([W - 170, 190, W + 60, 420], fill=(255, 228, 222))
    d.rectangle([0, H - 6, W, H], fill=TEAL)

    txt = fa(name)
    f = fit_font(d, txt, FONT_B, int(W * 0.62), start=64, min_size=20)
    bbox = d.textbbox((0, 0), txt, font=f)
    d.text((70, H / 2 - (bbox[3] - bbox[1]) / 2 - bbox[1]), txt, font=f, fill=TEAL)

    sub = fa("خرازی پرنسا")
    fs = ImageFont.truetype(FONT_R, 26)
    d.text((72, H / 2 + 52), sub, font=fs, fill=CORAL)
    im.save(path, 'JPEG', quality=88, optimize=True)


def make_product_placeholder(name, cat_name, path):
    """تصویر جایگزین ۸۰۰×۸۰۰ برای محصول بدون عکس واقعی."""
    S = 800
    im = Image.new('RGB', (S, S), WHITE)
    d = ImageDraw.Draw(im)
    d.rectangle([0, 0, S, 8], fill=TEAL)
    d.rectangle([0, S - 8, S, S], fill=CORAL)

    # کادر داخلی
    d.rounded_rectangle([40, 40, S - 40, S - 40], radius=26,
                        outline=(214, 238, 238), width=3)

    # نشان مرکزی
    cx = cy = S / 2
    d.ellipse([cx - 150, cy - 230, cx + 150, cy + 70], outline=TEAL, width=4)
    d.ellipse([cx - 118, cy - 198, cx + 118, cy + 38], outline=(180, 220, 220), width=2)
    d.line([(cx - 60, cy + 100), (cx + 60, cy + 100)], fill=TEAL, width=5)
    d.line([(cx, cy + 70), (cx, cy + 150)], fill=CORAL, width=5)

    # نام دسته
    ct = fa(cat_name)
    fc = fit_font(d, ct, FONT_B, S - 140, start=40, min_size=18)
    bbox = d.textbbox((0, 0), ct, font=fc)
    d.text((S / 2 - (bbox[2] - bbox[0]) / 2, cy + 210), ct, font=fc, fill=TEAL)

    # برچسب «تصویر نمونه»
    badge = fa("تصویر نمونه")
    fb = ImageFont.truetype(FONT_R, 24)
    bb = d.textbbox((0, 0), badge, font=fb)
    bw = bb[2] - bb[0] + 40
    d.rounded_rectangle([S / 2 - bw / 2, cy + 280, S / 2 + bw / 2, cy + 328],
                        radius=24, fill=(255, 240, 236))
    d.text((S / 2 - (bb[2] - bb[0]) / 2, cy + 292), badge, font=fb, fill=CORAL)

    im.save(path, 'PNG', optimize=True)


def main():
    # ── ۱) آیکون و بنر دسته‌بندی
    ic_dir = os.path.join(BASE, 'uploads', 'categories', 'icon')
    bn_dir = os.path.join(BASE, 'uploads', 'categories', 'banner')
    os.makedirs(ic_dir, exist_ok=True)
    os.makedirs(bn_dir, exist_ok=True)
    for cid, name in CATEGORIES.items():
        make_category_icon(cid, name, os.path.join(ic_dir, f'kharazi-cat-{cid}.png'))
        make_category_banner(cid, name, os.path.join(bn_dir, f'kharazi-cat-{cid}.png'))
    print(f'✅ {len(CATEGORIES)} آیکون و {len(CATEGORIES)} بنر دسته‌بندی ساخته شد')

    # ── ۲) تصویر جایگزین محصول — فقط اگر عکس واقعی وجود ندارد
    th_dir = os.path.join(BASE, 'uploads', 'products', 'thumbnail')
    ph_dir = os.path.join(BASE, 'uploads', 'products', 'photos')
    os.makedirs(ph_dir, exist_ok=True)

    # خواندن محصولات از پایگاه داده
    r = subprocess.run(
        ['mysql', '-uroot', '--default-character-set=utf8mb4', '-B', '-N', 'peransa-db',
         '-e', "SELECT p.id, c.id, c.name FROM products p "
               "JOIN categories c ON c.id=p.category_id ORDER BY p.id;"],
        capture_output=True)
    rows = [l.split('\t') for l in r.stdout.decode('utf-8').strip().split('\n') if l]

    created, kept = 0, 0
    for pid, cid, cname in rows:
        pid, cid = int(pid), int(cid)
        tpath = os.path.join(th_dir, f'kharazi-product-{pid}.png')
        ppath = os.path.join(ph_dir, f'kharazi-product-{pid}.png')
        if os.path.exists(tpath):
            kept += 1
            if not os.path.exists(ppath):
                # نسخهٔ بزرگ‌تر برای صفحهٔ محصول
                Image.open(tpath).convert('RGB').resize((800, 800), Image.LANCZOS)\
                     .save(ppath, 'PNG', optimize=True)
            continue
        make_product_placeholder(cname, CATEGORIES.get(cid, cname), tpath)
        Image.open(tpath).convert('RGB').save(ppath, 'PNG', optimize=True)
        created += 1

    print(f'✅ تصویر جایگزین ساخته شد برای {created} محصول')
    print(f'   عکس واقعی موجود بود برای {kept} محصول (دست‌نخورده ماند)')

    # ── ۳) لوگوی برند
    br_dir = os.path.join(BASE, 'uploads', 'brands')
    os.makedirs(br_dir, exist_ok=True)
    for bid in range(5, 20):
        p = os.path.join(br_dir, f'kharazi-brand-{bid}.png')
        if not os.path.exists(p):
            im = Image.new('RGB', (300, 300), WHITE)
            d = ImageDraw.Draw(im)
            d.ellipse([20, 20, 280, 280], outline=TEAL, width=4)
            d.ellipse([42, 42, 258, 258], outline=(200, 228, 228), width=2)
            t = fa("برند")
            f = ImageFont.truetype(FONT_B, 44)
            bb = d.textbbox((0, 0), t, font=f)
            d.text((150 - (bb[2] - bb[0]) / 2, 132), t, font=f, fill=TEAL)
            im.save(p, 'PNG', optimize=True)
    print('✅ لوگوی جایگزین برندها ساخته شد')


if __name__ == '__main__':
    main()

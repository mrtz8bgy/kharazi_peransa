<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Language extends Model
{
    /**
     * Determine text direction from the configured language, falling back
     * to the locale when no matching language record has been installed.
     *
     * @param  string|null  $locale
     * @return bool
     */
    public static function isRtlForLocale($locale)
    {
        $rtl = static::where('code', $locale)->value('rtl');

        if ($rtl !== null) {
            return (bool) $rtl;
        }

        return in_array(strtolower(substr((string) $locale, 0, 2)), ['ar', 'fa', 'he', 'ur'], true);
    }
}

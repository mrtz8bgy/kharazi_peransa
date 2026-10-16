<?php

namespace App\Http\Middleware;

use Closure;
use App;
use Session;
use Config;

class Language
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Session::has('locale')){
            $locale = Session::get('locale');
        }
        elseif(config('drikana.default_language') != null){
            $locale = config('drikana.default_language');
        }
        else{
            $locale = 'en';
        }

        if (!\App\Language::where('code', $locale)->exists()) {
            $defaultLanguage = config('drikana.default_language');
            $locale = $defaultLanguage && \App\Language::where('code', $defaultLanguage)->exists()
                ? $defaultLanguage
                : config('app.locale');
        }

        App::setLocale($locale);
        $request->session()->put('locale', $locale);

        return $next($request);
    }
}

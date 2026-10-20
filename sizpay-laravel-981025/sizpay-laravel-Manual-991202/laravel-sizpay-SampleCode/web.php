<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\ConsultController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\SizPayController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});
Route::get('/404', function () {
    return view('404');
});
Route::get('/buy',function(){

    return view('shop');

});
Route::post('/verify',[SizPayController::class,'verify_order']);
Route::post('/shop',[SizPayController::class,'add_order']);

Route::post('/logupController',[MemberController::class,'logup']);
Route::post('/loginController',[MemberController::class,'login']);
Route::get('/profile/{email}',[MemberController::class,'show'])->middleware('profile');;
Route::get('/logout',[MemberController::class,'logout']);
Route::get('/error/{errora}',[MemberController::class,'errorIndex']);
Route::post('/consultController',[ConsultController::class,'consultRequest']);
Route::get('/course/{route}',[CourseController::class,'show']);


<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admins\IndexController as AdminIndexController;
use App\Http\Controllers\Admins\CucianOfflineController;
use App\Http\Controllers\Admins\CucianOnlineController;
use App\Http\Controllers\Admins\KategoriController;
use App\Http\Controllers\Admins\PembelianController;
use App\Http\Controllers\Admins\AdminController;
use App\Http\Controllers\Admins\AdminProfileController;
use App\Http\Controllers\Auth\IndexController as AuthController;
use App\Http\Controllers\User\OrderController;
use App\Http\Controllers\User\UserProfileController;

Route::get('/tes', fn () =>  view('tes'));

Route::get('/', fn () => view('index'));
Route::get('/guest/order-detail', [OrderController::class, 'guestOrderDetail'])->name('guest.order-detail');

Route::get('/login', [AuthController::class, 'loginView'])->middleware('guest')->name('login');
Route::post('/login', [AuthController::class, 'login'])->name('login.store');
Route::get('/register', [AuthController::class, 'registerView'])->middleware('guest')->name('register');
Route::post('/register', [AuthController::class, 'register'])->name('register.store');
Route::delete('/logout', [AuthController::class, 'logout'])->name('logout');

Route::prefix('user')->name('user.')->middleware(['auth', 'user'])->group(function () {
	Route::get('/', [OrderController::class, 'index'])->name('index');
	Route::get('/order/detail/{no_order}', [OrderController::class, 'userOrderDetail'])->name('order.detail');
	Route::get('/order', [OrderController::class, 'orderConfirmation'])->name('order.confirmation');
	Route::post('/order', [OrderController::class, 'store'])->name('order.store');

	Route::post('/pembayaran', [OrderController::class, 'bayar'])->name('pembayaran.store');
	Route::get('/status-payment', [OrderController::class, 'statusPayment'])->name('pembayaran.status');
	Route::delete('/pembayaran', [OrderController::class, 'cancel'])->name('pembayaran.cancel');
	
	Route::get('/profile', [UserProfileController::class, 'profile'])->name('profile')->middleware('auth');
	Route::post('/users/dashboard/profile/', [UserProfileController::class, 'update'])->name('profile.update');

});

Route::prefix('/admin')->name('admin.')->middleware(['auth', 'admin'])->group(function () {
	Route::get('/', [AdminIndexController::class, 'index'])->name('index');

	Route::get('/laporan/detail/{no_order}', [AdminIndexController::class, 'detail'])->name('detail');

	Route::get('/cucian-offline', [CucianOfflineController::class, 'index'])->name('cucian-offline');
	Route::get('/cucian-offline/detail/{no_order}', [CucianOfflineController::class, 'detail'])->name('cucian-offline.detail');
	Route::get('/cucian-offline/store/confirmation', [CucianOfflineController::class, 'storeConfirmation'])->name('cucian-offline.store.confirmation');
	Route::post('/cucian-offline/store', [CucianOfflineController::class, 'store'])->name('cucian-offline.store');
	Route::get('/cucian-offline/selesaikan/{no_order}', [CucianOfflineController::class, 'selesaikan'])->name('cucian-offline.selesaikan');
	Route::get('/cucian-offline/diambil/{no_order}', [CucianOfflineController::class, 'diambil'])->name('cucian-offline.diambil');
	Route::get('/cucian-offline/hapus/{no_order}', [CucianOfflineController::class, 'delete'])->name('cucian-offline.hapus');
	Route::get('/cucian-offline/edit/detail/{no_order}', [CucianOfflineController::class, 'edit'])->name('cucian-offline.edit');
	Route::get('/cucian-offline/edit/confirmation', [CucianOfflineController::class, 'editConfirmation'])->name('cucian-offline.edit.confirmation');
	Route::post('/cucian-offline/edit', [CucianOfflineController::class, 'update'])->name('cucian-offline.update');

	Route::get('/cucian-online', [CucianOnlineController::class, 'index'])->name('cucian-online');
	Route::get('/cucian-online/detail/{no_order}', [CucianOnlineController::class, 'detail'])->name('cucian-online.detail');
	Route::get('/cucian-online/edit/confirmation', [CucianOnlineController::class, 'editConfirmation'])->name('cucian-online.edit.confirmation');
	Route::get('/cucian-online/edit/detail/{no_order}', [CucianOnlineController::class, 'edit'])->name('cucian-online.edit');
	Route::post('/cucian-online/edit', [CucianOnlineController::class, 'update'])->name('cucian-online.update');
	Route::get('/cucian-online/hapus/{no_order}', [CucianOnlineController::class, 'delete'])->name('cucian-online.hapus');
	Route::get('/cucian-online/selesaikan/{no_order}', [CucianOnlineController::class, 'selesaikan'])->name('cucian-online.selesaikan');
	Route::get('/cucian-online/diambil/{no_order}', [CucianOnlineController::class, 'diambil'])->name('cucian-online.diambil');
	Route::get('/cucian-online/proses-order/detail/{no_order}', [CucianOnlineController::class, 'prosesOrder'])->name('cucian-online.proses-order');
	Route::get('/cucian-online/proses-order/confirmation', [CucianOnlineController::class, 'prosesOrderConfirmation'])->name('cucian-online.proses-order.confirmation');
	Route::post('/cucian-online/proses-order', [CucianOnlineController::class, 'prosesOrderUpdate'])->name('cucian-online.proses-order.update');

	Route::get('/kategori', [KategoriController::class, 'index'])->name('kategori');
	Route::post('/kategori/store', [KategoriController::class, 'store'])->name('kategori.store');
	Route::get('/kategori/hapus/{id}', [KategoriController::class, 'delete'])->name('kategori.hapus');
	Route::get('/kategori/edit/{id}', [KategoriController::class, 'edit'])->name('kategori.edit');
	Route::post('/kategori/edit/{id}', [KategoriController::class, 'update'])->name('kategori.update');

	Route::get('/pembelian', [PembelianController::class, 'index'])->name('pembelian');
	Route::get('/pembelian/detail/{no_order}', [PembelianController::class, 'detail'])->name('pembelian.detail');
	Route::post('/pembelian', [PembelianController::class, 'store'])->name('pembelian.store');
	Route::get('/pembelian/edit/{kode_beli}', [PembelianController::class, 'edit'])->name('pembelian.edit');
	Route::post('/pembelian/edit/{kode_beli}', [PembelianController::class, 'update'])->name('pembelian.update');
	Route::get('/pembelian/hapus/{no_order}', [PembelianController::class, 'delete'])->name('pembelian.hapus');

	Route::get('/users', [AdminController::class, 'index'])->name('users');
	Route::post('/users', [AdminController::class, 'store'])->name('users.store');
	Route::delete('/users/{id}', [AdminController::class, 'delete'])->name('users.delete');

	Route::get('/profile', [AdminProfileController::class, 'profile'])->name('profile');
	Route::put('/dashboard/profile/', [AdminProfileController::class, 'update'])->name('profile.update');
});
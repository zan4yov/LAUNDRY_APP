<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IndexController extends Controller
{
	public function loginView()
	{
		return view('auth.login');
	}

	public function registerView()
	{
		return view('auth.register');
	}

	public function login(Request $request)
	{
		$message =[
			'email.required'=> '* Email Wajib Diisi',
			'password'=> '* Password Wajib Diisi',
		];

		$remember = $request->has('remember');
		$credentials =  $request->validate([
			'email' => 'required|email',
			'password' => 'required|min:6'
		], $message);

		if (Auth::attempt($credentials, $remember)) {
			$request->session()->regenerate();
			if (auth()->user()->role == 'pelanggan') {
				return redirect()->route('user.index')->with('success', 'Berhasil login');
			} else if (auth()->user()->role == 'admin') {
				return redirect()->route('admin.index')->with('success', 'Berhasil login admin');
			}
		}
		return redirect()->back()->with('error', 'Email atau password salah');
	}

	public function register(Request $request)
	{
		$message =[
			'nama.required' => '* Nama Wajib Diisi',
			'alamat.required' => '* Alamat Wajib Diisi',
			'email.required' => '* Email Wajib Diisi',
			'no_telp' => '* No. Telepon Wajib Diisi',
			'no_wa' => '* No. WhatsApp Wajib Diisi',
			'password.required' => '* Password Wajib Diisi',
			'password.confirmed' => '* Konfirmasi Password Kosong',
		];

		$request->validate([
			'nama' => 'required',
			'alamat' => 'required',
			'email' => 'required|email',
			'no_telp' => 'required_without:no_wa',
			'no_wa' => 'required_without:no_telp',
			'password' => 'required|confirmed|min:6',
		], $message);
		$no_telp = $request->kode_telp . '' . $request->no_telp;
		$request['no_telp'] = $no_telp;
		$no_wa = $request->kode_wa . '' . $request->no_wa;
		$request['no_wa'] = $no_wa;
		$request['password'] = bcrypt($request->password);
		$request['role'] = 'pelanggan';

		User::create([
			'nama' => $request->nama,
			'alamat' => $request->alamat,
			'email' => $request->email,
			'no_telp' => $request->no_telp,
			'no_wa' => $request->no_wa,
			'password' => $request->password,
			'role' => $request->role
		]);
		return redirect()->route('login')->with('success', 'Berhasil membuat akun baru, silahkan login');
	}

	public function logout(Request $request)
	{
		Auth::logout();
		$request->session()->invalidate();
		$request->session()->regenerateToken();

		return redirect()->route('login')->with('success', 'Anda telah logout');
	}
}

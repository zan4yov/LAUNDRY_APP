<?php

namespace App\Http\Controllers\Admins;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class AdminProfileController extends Controller
{
	public function profile()
	{
		$user = User::findOrFail(auth()->user()->id);
		return view('admin.dashboard.profile', compact('user'));
	}

	public function update(Request $request)
	{
		$userId = auth()->user()->id;
		// Validasi input pengguna
		$request->validate([
			'nama' => 'required|string|min:2|max:100',
			'email' => 'required|email|unique:users,email,' . $userId . ',id',
			'no_telp' => 'required_without:no_wa',
			'no_wa' => 'required_without:no_telp',
			'old_password' => 'nullable|string',
			'password' => 'nullable|required_with:old_password|string|min:6',
			'alamat' => 'required|string|min:10|max:100',
			'inputImg' => 'nullable|mimes:jpg,png,jpeg'
		]);

		$urlImg = User::where('id', $userId)->first()->img;
		if ($request->hasFile('inputImg')) {
			$url = str_replace('/storage', '', parse_url($urlImg, PHP_URL_PATH));
			Storage::delete($url);
			$newNameImg = $request->file('inputImg')->hashName("upload/profile/");
			$path = $request->file('inputImg')->storeAs($newNameImg);
			$urlImg = Storage::url($path);
		}

		// Dapatkan pengguna berdasarkan ID
		$user = User::findOrFail($userId);

		// Update informasi profil
		$user->nama = $request->input('nama');
		$user->email = $request->input('email');
		$user->no_telp = $request->input('no_telp');
		$user->no_wa = $request->input('no_wa');
		$user->alamat = $request->input('alamat');
		$user->img = $urlImg;

		// Jika pengguna memasukkan password lama, cek dan update password baru
		if ($request->filled('old_password')) {
			if (Hash::check($request->old_password, $user->password)) {
				$user->password = Hash::make($request->input('password'));
			} else {
				return redirect()->back()->withErrors(['old_password' => 'Password lama tidak sesuai']);
			}
		}

		// Simpan perubahan ke database
		$user->save();

		// Redirect ke halaman profil dengan pesan sukses
		return redirect()->route('admin.profile')->with('success', 'Berhasil update profile');
	}
}
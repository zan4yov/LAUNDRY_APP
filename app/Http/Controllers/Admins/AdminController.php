<?php

namespace App\Http\Controllers\Admins;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AdminController extends Controller
{
	public function index(Request $request)
	{
		$search = $request->search ?? '';
		$users = User::where('role', 'admin')
			->whereNot('id', auth()->user()->id)
			->where(function ($query) use ($request) {
				$query->where('nama', 'like', '%' . $request->search . '%')
					->orWhere('email', 'like', '%' . $request->search . '%');
			})
			->orderBy('updated_at', 'desc')
			->get();
		return view('admin.users.index', compact('users'));
	}

	public function store(Request $request)
	{
		$message =[
			'nama.required' => '* Nama Wajib diisi',
			'email.required' => '* Email Wajib diisi',
			'no_telp' => '* No. Telepon Wajib diisi',
			'no_wa' => '* No. WhatsApp Wajib diisi',
			'password.required' => '* Password Wajib diisi',
			'password.confirmed' => '* Konfirmasi Password Kosong',
		];

		$request->validate([
			'nama' => 'required',
			'email' => 'required|email|unique:users',
			'no_telp' => 'required_without:no_wa',
			'no_wa' => 'required_without:no_telp',
			'password' => 'required|min:6|confirmed',
		], $message);

		User::create([
			'nama' => $request->nama,
			'email' => $request->email,
			'role' => 'admin', // default role, you can change as per requirement
			'no_telp' => $request->no_telp,
			'no_wa' => $request->no_wa,
			'alamat' => $request->alamat,
			'password' => bcrypt($request->password),
		]);

		return redirect()->back()->with('success', 'User created successfully.');
	}

	public function delete($id)
	{
		User::find($id)->delete();
		return redirect()->back()->with('success', 'Admin berhasil di hapus');
	}
}

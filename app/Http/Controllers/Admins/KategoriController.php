<?php

namespace App\Http\Controllers\Admins;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Kategori;
use DB;

class KategoriController extends Controller
{
	
	public function index()
	{
		$kategori = DB::table('kategori')->orderBy('updated_at', 'desc')->get();
		return view('admin.kategori.index', compact('kategori'));
	}

	public function store(Request $request)
	{
		$messages =[
			'nama.required' => '* Nama Kategori Wajib diisi',
			'harga.required' => '* Harga Wajib diisi',
			'estimasi_hari.required' => '* Estimasi Wajib diisi',
			];

		$request->validate([
			'nama' => 'required',
			'harga' => 'required',
			'estimasi_hari' => 'required',
		], $messages);

		DB::table('kategori')->insert([
			'nama'=> $request->nama,
			'harga'=> $request->harga,
			'estimasi_hari'=> $request->estimasi_hari,
		]);

		return redirect()->route('admin.kategori')->with('success', 'Data Kategori berhasil ditambahkan');
	}
	

	public function delete($id)
	{
		Kategori::where('id', $id)->delete();
		return redirect()->route('admin.kategori')->with('success', 'Data Kategori telah dihapus');
	}

	public function edit($id)
	{
		$kategori = Kategori::where('id', $id)->first();
		return view('admin.kategori.edit', compact('kategori'));
	}

	public function update(Request $request, $id)
	{
		$messages =[
			'nama.required' => '* Nama Kategori Wajib diisi',
			'harga.required' => '* Harga Wajib diisi',
			'estimasi_hari.required' => '* Estimasi Wajib diisi',
			];

		$request->validate([
			'nama' => 'required',
			'harga' => 'required',
			'estimasi_hari' => 'required',
		], $messages);

		Kategori::where('id', $id)->update([
			'nama' => $request->nama,
			'harga' => $request->harga,
			'estimasi_hari' => $request->estimasi_hari,
		]);

		return redirect()->route('admin.kategori')->with('success', 'Data Kategori berhasil diupdate');
	}
}

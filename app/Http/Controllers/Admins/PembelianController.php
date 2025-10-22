<?php

namespace App\Http\Controllers\Admins;

use App\Models\Pembelian;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class PembelianController extends Controller
{
	public function index(Request $request)
	{
		$paginate = $request->paginate ?? 15;
		$request->search ?? '';

		$pembelians = Pembelian::where('merk', 'like', '%' . $request->search . '%')
			->orWhere('jenis_bahan', 'like', '%' . $request->search . '%')
			->orWhere('kode_beli', 'like', '%' . $request->search . '%')
			->orderBy('updated_at', 'desc')
			->paginate($paginate)->withQueryString();
			
		return view('admin.pembelian.index', compact('pembelians'));
	}

	public function detail($kode_beli)
	{
		$detail = Pembelian::where('kode_beli', $kode_beli)->first();
		$detail->tanggal_beli = Carbon::createFromFormat('Y-m-d H:i:s', $detail->wkt_beli)->format('Y-m-d');
		$detail->jam_beli = Carbon::createFromFormat('Y-m-d H:i:s', $detail->wkt_beli)->format('H:i');
		return view('admin.pembelian.detail', compact('detail'));
	}

	public function store(Request $request)
	{
		$message =[
			'tanggal_beli.required' => '* Tanggal Pembelian Wajib diisi',
			'jam__beli.required' => '* Waktu Pembelian Wajib diisi',
			'jenis_bahan.required' => '* Jenis Bahan Wajib diisi',
			'merk.required' => '* Merk Wajib diisi',
			'jumlah_beli.required' => '* Jumlah Beli Wajib diisi',
			'total_harga.required' => '* Total Harga Wajib diisi',
			'bukti.required' => '* Bukti Pembelian Wajib diunggah',
		];
		$request->validate([
			'tanggal_beli' => 'required',
			'jam_beli' => 'required|date_format:H:i',
			'jenis_bahan' => 'required',
			'merk' => 'required',
			'jumlah_beli' => 'required|numeric',
			'total_harga' => 'required|numeric',
			'bukti' => 'required|mimes:jpg,png,jpeg',
		], $message);

		$newNameBukti = $request->file('bukti')->hashName("upload/bukti-pembelian/");
		$path = $request->file('bukti')->storeAs($newNameBukti);
		$urlBukti = Storage::url($path);
		$wkt_beli = Carbon::createFromFormat('Y-m-d H:i', $request->tanggal_beli . ' ' . $request->jam_beli);

		Pembelian::create([
			'kode_beli' => Str::of(Str::random(10))->lower(),
			'wkt_beli' => $wkt_beli,
			'jenis_bahan' => $request->jenis_bahan,
			'merk' => $request->merk,
			'jumlah_beli' => $request->jumlah_beli,
			'total_harga' => $request->total_harga,
			'bukti' => $urlBukti,
		]);

		return redirect()->route('admin.pembelian')->with('success', 'Data pembelian berhasil ditambahkan');
	}

	public function edit($kode_beli)
	{
		$pembelian = Pembelian::where('kode_beli', $kode_beli)->first();
		$pembelian->tanggal_beli = Carbon::createFromFormat('Y-m-d H:i:s', $pembelian->wkt_beli)->format('Y-m-d');
		$pembelian->jam_beli = Carbon::createFromFormat('Y-m-d H:i:s', $pembelian->wkt_beli)->format('H:i');
		// dd($pembelian);
		return view('admin.pembelian.edit', compact('pembelian'));
	}

	public function update(Request $request, $kode_beli)
	{
		$message =[
			'tanggal_beli.required' => '* Tanggal Pembelian Wajib diisi',
			'jam__beli.required' => '* Waktu Pembelian Wajib diisi',
			'jenis_bahan.required' => '* Jenis Bahan Wajib diisi',
			'merk.required' => '* Merk Wajib diisi',
			'jumlah_beli.required' => '* Jumlah Beli Wajib diisi',
			'total_harga.required' => '* Total Harga Wajib diisi',
			'bukti.required' => '* Bukti Pembelian Wajib diunggah',
		];
		
		$request->validate([
			'tanggal_beli' => 'required',
			'jam_beli' => 'required|date_format:H:i',
			'jenis_bahan' => 'required',
			'merk' => 'required',
			'jumlah_beli' => 'required|numeric',
			'total_harga' => 'required|numeric',
			'bukti' => 'nullable|mimes:jpg,png,jpeg',
		], $message);

		$urlBukti = Pembelian::where('kode_beli', $kode_beli)->first()->bukti;
		if($request->hasFile('bukti')) {
			$url = str_replace('/storage', '', parse_url($urlBukti, PHP_URL_PATH));
			Storage::delete($url);
			$newNameBukti = $request->file('bukti')->hashName("upload/bukti-pembelian/");
			$path = $request->file('bukti')->storeAs($newNameBukti);
			$urlBukti = Storage::url($path);
		}
		
		$wkt_beli = Carbon::createFromFormat('Y-m-d H:i', $request->tanggal_beli . ' ' . $request->jam_beli);

		Pembelian::where('kode_beli', $kode_beli)->update([
			'wkt_beli' => $wkt_beli,
			'jenis_bahan' => $request->jenis_bahan,
			'merk' => $request->merk,
			'jumlah_beli' => $request->jumlah_beli,
			'total_harga' => $request->total_harga,
			'bukti' => $urlBukti,
		]);

		return redirect()->route('admin.pembelian')->with('success', 'Data pembelian berhasil diupdate');
	}

	public function delete($kode_beli)
	{
		Pembelian::where('kode_beli', $kode_beli)->delete();

		return redirect()->route('admin.pembelian')->with('success', 'Data pembelian berhasil dihapus');
	}
}

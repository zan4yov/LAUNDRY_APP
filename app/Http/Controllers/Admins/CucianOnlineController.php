<?php

namespace App\Http\Controllers\Admins;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cucian;
use App\Models\Kategori;
use App\Utils\SendWhatsapp;
use Carbon\Carbon;

class CucianOnlineController extends Controller
{

	public function index(Request $request)
	{
		$paginate = $request->paginate ?? 15;
		$kategori = Kategori::all();
		$request->status_cucian ?? '';
		$request->status_bayar ?? '';
		$request->search ?? '';

		$cucian = Cucian::with(['kategori', 'user'])
			->where(function ($query) use ($request) {
				$query->where('no_order', 'like', '%' . $request->search . '%')
					->orWhere('atas_nama', 'like', '%' . $request->search . '%')
					->orWhereHas('user', function ($query) use ($request) {
						$query->where('nama', 'like', '%' . $request->search . '%');
					});
			})
			->where('jenis_order', 'online')
			->where('status_cucian', 'like', '%' . $request->status_cucian . '%')
			->whereNot('status_cucian', 'diambil')
			->where('status_bayar', 'like', $request->status_bayar . '%')
			->orderBy('updated_at', 'desc')
			->paginate($paginate)->withQueryString();

		return view('admin.cucian-online.index', compact('cucian', 'kategori'));
	}

	public function detail($no_order)
	{
		$detail = Cucian::where('no_order', $no_order)->first();
		return view('admin.cucian-online.detail', compact('detail'));
	}

	public function prosesOrder($no_order)
	{
		$cucian = Cucian::where('no_order', $no_order)->first();
		$kategori = Kategori::all();
		return view('admin.cucian-online.proses-order', compact('cucian', 'kategori'));
	}

	public function prosesOrderConfirmation(Request $request)
	{
		$request->validate([
			'atas_nama' => 'required',
			'alamat_antar' => 'required',
			'jenis_ambil' => 'required',
			'berat' => 'required',
			'kategori_id' => 'required',
			'no_wa' => 'required_without:no_telp',
			'no_telp' => 'required_without:no_wa',
		]);
		$kategori = Kategori::where('id', $request->kategori_id)->first();
		$ongkir_antar = $request['jenis_ambil'] == 'diantar' ? 2000 : 0;
		$ongkir_jemput = 2000;

		$request = $request->all();
		$request['kategori'] = $kategori;
		$request['ongkir_antar'] = $ongkir_antar;
		$request['ongkir_jemput'] = $ongkir_jemput;
		$request['harga'] = $request['kategori']['harga'] * $request['berat'];
		$request['total_harga'] = $request['harga'] + $ongkir_antar + $ongkir_jemput;

		return view('admin.cucian-online.proses-order-confirmation', compact('request'));
	}

	public function prosesOrderUpdate(Request $request)
	{
		$kategori = Kategori::where('id', $request->kategori_id)->first();
		$estimasi_hari = (int) $kategori->estimasi_hari;  // Cast to int
		$estimasi = Carbon::createFromFormat('Y-m-d H:i:s', now())->copy()->addDays($estimasi_hari);

		$response = SendWhatsapp::notifikasiProses([
			'no_order' => $request->no_order,
			'atas_nama' => $request->atas_nama,
			'kategori' => Kategori::where('id', $request->kategori_id)->first()->nama,
			'berat' => $request->berat,
			'total_harga' => $request->total_harga,
			'estimasi' => $kategori->estimasi_hari,
			'nama_admin' => auth()->user()->nama,
			'no_wa' => $request->no_wa,
		]);

		// dd($response);

		Cucian::where('no_order', $request['no_order'])->update([
			"atas_nama" => $request->atas_nama,
			"alamat_antar" => $request->alamat_antar,
			"no_wa" => $request->no_wa,
			"no_telp" => $request->no_telp,
			"kategori_id" => $request->kategori_id,
			"berat" => $request->berat,
			"jenis_ambil" => $request->jenis_ambil,
			"ongkir_jemput" => $request->ongkir_jemput,
			"ongkir_antar" => $request->ongkir_antar,
			"total_harga" => $request->total_harga,
			"status_cucian" => 'diproses',
			"estimasi" => $estimasi,
		]);
		return redirect()->route('admin.cucian-online')->with('success', 'Order cucian berhasil diproses');
	}

	public function delete($no_order)
	{
		Cucian::where('no_order', $no_order)->delete();
		return redirect()->route('admin.cucian-online')->with('success', 'Cucian telah dihapus');
	}

	public function edit($no_order)
	{
		$cucian = Cucian::where('no_order', $no_order)->first();
		$kategori = Kategori::all();
		return view('admin.cucian-online.edit', compact('cucian', 'kategori'));
	}

	public function editConfirmation(Request $request)
	{
		$request->validate([
			'atas_nama' => 'required',
			'alamat_antar' => 'required',
			'jenis_ambil' => 'required',
			'berat' => 'required',
			'kategori_id' => 'required',
			'no_wa' => 'required_without:no_telp',
			'no_telp' => 'required_without:no_wa',
		]);
		$kategori = Kategori::where('id', $request->kategori_id)->first();
		$ongkir_antar = $request['jenis_ambil'] == 'diantar' ? 2000 : 0;

		$request = $request->all();
		$request['kategori'] = $kategori;
		$request['ongkir_antar'] = $ongkir_antar;
		$request['harga'] = $request['kategori']['harga'] * $request['berat'];
		$request['total_harga'] = $request['harga'] + $ongkir_antar;

		return view('admin.cucian-online.edit-confirmation', compact('request'));
	}

	public function update(Request $request)
	{
		Cucian::where('no_order', $request['no_order'])->update([
			"atas_nama" => $request->atas_nama,
			"alamat_antar" => $request->alamat_antar,
			"no_wa" => $request->no_wa,
			"no_telp" => $request->no_telp,
			"kategori_id" => $request->kategori_id,
			"berat" => $request->berat,
			"jenis_ambil" => $request->jenis_ambil,
			"ongkir_antar" => $request->ongkir_antar,
			"total_harga" => $request->total_harga,
		]);
		return redirect()->route('admin.cucian-online')->with('success', 'Data cucian online berhasil diupdate');
	}

	public function selesaikan($no_order)
	{
		$cucian = Cucian::where('no_order', $no_order)->first();
		if($cucian->jenis_ambil == 'ambil sendiri'){
			$response = SendWhatsapp::notifikasiSelesaiAmbilSendiri([
				'no_order' => $cucian->no_order,
				'atas_nama' => $cucian->atas_nama,
				'kategori' => Kategori::where('id', $cucian->kategori_id)->first()->nama,
				'nama_admin' => auth()->user()->nama,
				'no_wa' => $cucian->no_wa,
			]);
			// dd($response);
		} else if($cucian->jenis_ambil == 'diantar'){
			$response = SendWhatsapp::notifikasiSelesaiDiantar([
				'no_order' => $cucian->no_order,
				'atas_nama' => $cucian->atas_nama,
				'kategori' => Kategori::where('id', $cucian->kategori_id)->first()->nama,
				'alamat' => $cucian->alamat_antar,
				'nama_admin' => auth()->user()->nama,
				'no_wa' => $cucian->no_wa,
			]);
			// dd($response);
		}
		
		$cucian->update([
			"status_cucian" => 'selesai',
			"estimasi" => null,
			"wkt_selesai" => now()
		]);
		return redirect()->route('admin.cucian-online')->with('success', 'Cucian berhasil diselesaikan');
	}

	public function diambil($no_order)
	{
		Cucian::where('no_order', $no_order)->update([
			"status_cucian" => 'diambil',
			"status_bayar" => 'dibayar',
			"wkt_diambil" => now()
		]);
		return redirect()->route('admin.cucian-online')->with('success', 'Cucian telah diambil');
	}

}

<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Cucian;
use App\Models\Kategori;
use App\Utils\SendWhatsapp;
use Illuminate\Http\Request;
use Illuminate\Support\Str;


class OrderController extends Controller
{
	public function index(Request $request)
	{
		$paginate = $request->paginate ?? 15;
		$request->status_cucian ?? '';
		$request->search ?? '';
		$kategori = Kategori::all();

		$cucian = Cucian::with('kategori')
			->where('user_id', auth()->user()->id)
			->where('no_order', 'like', '%' . $request->search . '%')
			->where('status_cucian', 'like', '%' . $request->status_cucian . '%')
			->orderBy('updated_at', 'desc')
			->paginate($paginate)->withQueryString();

		return view('users.dashboard.index', compact('cucian', 'kategori'));
	}

	public function guestOrderDetail(Request $request)
	{
		$no_order = $request->no_order;
		$detail = Cucian::where('no_order', $no_order)->first();
		$is_success = $detail ? true : false;
		return view('users.guest.order-detail', compact('detail', 'is_success'));
	}

	public function userOrderDetail($no_order)
	{
		$detail = Cucian::where('no_order', $no_order)->first();
		return view('users.dashboard.detail', compact('detail'));
	}

	public function orderConfirmation(Request $request)
	{
		$message =[
			'atas_nama.required' => '* Nama Pemesan Cucian Wajib Diisi',
			'alamat_antar.required' => '* Alamat Pengantaran Cucian Wajib Diisi',
			'no_telp' => '* No. Telepon Pemesan Cucian Wajib Diisi',
			'no_wa' => '* No. WhatsApp Pemesan Cucian Wajib Diisi',
			'kategori_id.required' => '* Kategori Cucian Wajib Diisi',
			'jenis_ambil.required' => '* Jenis Pengambilan Cucian Wajib Diisi',
		];
		$request->validate([
			'atas_nama' => 'required',
			'alamat_antar' => 'required',
			'no_telp' => 'required_without:no_wa',
			'no_wa' => 'required_without:no_telp',
			'kategori_id' => 'required',
			'jenis_ambil' => 'required',
		], $message);
		$kategori = Kategori::where('id', $request->kategori_id)->first();
		$ongkir_antar = $request['jenis_ambil'] == 'diantar' ? 2000 : 0;
		$ongkir_jemput = 2000;

		$request = $request->all();
		$request['kategori'] = $kategori;
		$request['ongkir_antar'] = $ongkir_antar;
		$request['ongkir_jemput'] = $ongkir_jemput;

		return view('users.dashboard.order-confirmation', compact('request'));
	}

	public function store(Request $request)
	{
		$no_order = Str::of(Str::random(10))->lower();
		$ongkir_antar = $request->jenis_ambil == 'diantar' ? 2000 : 0;

		$response = SendWhatsapp::notifikasiPesananBaruOnline([
			'nama_pelanggan' => auth()->user()->nama,
			'no_order' => $no_order,
			'atas_nama' => $request->atas_nama,
			'kategori' => Kategori::where('id', $request->kategori_id)->first()->nama,
			'alamat' => $request->alamat_antar,
			'jenis_ambil' => $request->jenis_ambil,
			'no_wa' => $request->no_wa,
		]);
		// dd($response->json());
		Cucian::create([
			'no_order' => $no_order,
			'user_id' => auth()->user()->id,
			'kategori_id' => $request->kategori_id,
			'wkt_order' => now(),
			'no_wa' => $request->no_wa,
			'no_telp' => $request->no_telp,
			'atas_nama' => $request->atas_nama,
			'alamat_antar' => $request->alamat_antar,
			'jenis_order' => 'online',
			'jenis_ambil' => $request->jenis_ambil,
			'ongkir_antar' => $ongkir_antar,
			'ongkir_jemput' => 2000,
			'status_bayar' => 'belum dibayar',
		]);
		return redirect()->route('user.index')->with('success', 'Order cucian berhasil');
	}

	public function bayar(Request $request)
	{
		\Midtrans\Config::$serverKey = config('utils.MIDTRANS_SERVER_KEY');

		$cucian = Cucian::where('no_order', $request['no_order'])->first();
		$isHasSnapToken = $cucian->snap_token ?? false;

		if (!$isHasSnapToken) {
			$snapToken = $this->snapToken($cucian);
			return redirect()->back()->with('snapToken', $snapToken);
		}
		try {
			$response = \Midtrans\Transaction::status($cucian->no_order);
			if ($response->transaction_status == 'expire') {
				$cucian->update([
					'no_order' => Str::random(10),
					'snap_token' => null,
				]);
				return redirect('user/order/detail/' . $cucian->no_order)->with('error', 'pembayaran expired, coba lagi');
			}
			if ($response->transaction_status == 'pending') {
				return redirect()->back()->with('snapToken', $cucian->snap_token);
			}
		} catch (\Exception $e) {
			if ($e->getCode() == 404) {
				return redirect()->back()->with('snapToken', $cucian->snap_token);
			}
			dd($e);
		}
	}

	public function statusPayment(Request $request)
	{
		try {
			\Midtrans\Config::$serverKey = config('utils.MIDTRANS_SERVER_KEY');
			$response = \Midtrans\Transaction::status($request->order_id);
			$cucian = Cucian::where('no_order', $request->order_id)->first();
			$request['no_order'] = $cucian->no_order;

			if ($response->status_code == '200' && $response->transaction_status == 'settlement') {
				$cucian->update([
					'status_bayar' => 'dibayar'
				]);
			};
			$responseWa = SendWhatsapp::notifikasiSuksesBayar([
				'nama_pelanggan' => $cucian->user->nama,
				'no_order' => $cucian->no_order,
				'atas_nama' => $cucian->atas_nama,
				'kategori' => $cucian->kategori->nama,
				'total_bayar' => $response->gross_amount,
				'no_wa' => $cucian->no_wa,
			]);

			return view('users.payment-success', compact('request'));
		} catch (\Exception $e) {
			if ($e->getCode() == '404') {
				return redirect('404');
			}
			return redirect()->route('user.index');
		}
	}

	public function cancel(Request $request)
	{
		\Midtrans\Config::$serverKey = config('utils.MIDTRANS_SERVER_KEY');

		$cucian = Cucian::where('no_order', $request->no_order)->first();
		try {
			$response = \Midtrans\Transaction::cancel($request->no_order);
			$cucian->update([
				'no_order' => Str::random(10),
				'snap_token' => null,
			]);
			return redirect('user/order/detail/' . $cucian->no_order)->with('success', 'pembayaran dibatalkan');
		} catch (\Exception $e) {
			if ($e->getCode() == 404) {
				$cucian->update([
					'no_order' => Str::random(10),
					'snap_token' => null,
				]);
				return redirect('user/order/detail/' . $cucian->no_order)->with('success', 'pembayaran dibatalkan');
			}
		}
	}

	public function snapToken($cucian)
	{
		try {
			$params = array(
				'transaction_details' => [
					'order_id' => $cucian->no_order,
					'gross_amount' => $cucian->total_harga
				],
				'item_details' => [
					[
						"price" => $cucian->kategori->harga,
						"quantity" => $cucian->berat,
						"name" => $cucian->kategori->nama,
					],
					[
						"price" => $cucian->ongkir_jemput,
						"quantity" => 1,
						"name" => 'Ongkir Jemput',
					],
					[
						"price" => $cucian->ongkir_antar,
						"quantity" => 1,
						"name" => 'Ongkir Antar',
					],
					[
						"price" => 1000,
						"quantity" => 1,
						"name" => 'Biaya Transfer',
					],
				],
				'customer_details' => [
					'first_name' => $cucian->atas_nama,
					'email' => $cucian->user->email,
					'phone' => $cucian->no_telp
				],
			);
			$snapToken = \Midtrans\Snap::getSnapToken($params);
			$cucian->update([
				'snap_token' => $snapToken,
			]);

			return $snapToken;
		} catch (\Exception $e) {
			dd($e);
		}
	}
}

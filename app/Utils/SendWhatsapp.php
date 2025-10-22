<?php

namespace App\Utils;

use Illuminate\Support\Facades\Http;

class SendWhatsapp
{
	public static function notifikasiPesananBaruOnline($data = [])
	{
		$message = "*Halo {$data['nama_pelanggan']}*,
Terima kasih atas pemesanan anda di *Washwes*. Kami telah menerima pesanan laundry anda dengan detail pesanan sebagai berikut:

*Nomor Order : {$data['no_order']}*
*Atas Nama : {$data['atas_nama']}*
*Kategori : {$data['kategori']}*
*Alamat : {$data['alamat']}*
*Jenis Ambil : {$data['jenis_ambil']}*

Pesanan laundry anda saat ini sedang dalam status *_MENUNGGU_*. Kami akan segera menuju alamatmu!";

		$response = Http::post('http://wa.faycook.my.id/send-message', [
			"api_key" => config('utils.WA_API_KEY'),
			"sender" => config('utils.WA_SENDER'),
			"number" => $data['no_wa'],
			"message" => $message
		]);
		return $response;
	}

	public static function notifikasiProses($data = [])
	{
		$message = "*Halo Pelanggan Washwes*,
Saat ini pesanan laundry anda sedang dalam *_PROSES_* dengan detail pesanan sebagai berikut:

*Nomor Order : {$data['no_order']}*
*Atas Nama : {$data['atas_nama']}*
*Status Cucian : DIPROSES*
*Kategori : {$data['kategori']}*
*Berat : {$data['berat']} KG*
*Total Harga : Rp{$data['total_harga']}*
*Estimasi Selesai : {$data['estimasi']} Hari*

Kami akan segera memproses cucianmu!

admin washwes by @{$data['nama_admin']}";

		$response = Http::post('http://wa.faycook.my.id/send-message', [
			"api_key" => config('utils.WA_API_KEY'),
			"sender" => config('utils.WA_SENDER'),
			"number" => $data['no_wa'],
			"message" => $message
		]);
		return $response;
	}

	public static function notifikasiSelesaiAmbilSendiri($data = [])
	{
		$message = "*Halo Pelanggan Washwes*,
Pesanan laundry anda sudah *_SELESAI_* dengan detail pesanan sebagai berikut:

*Nomor Order : {$data['no_order']}*
*Atas Nama : {$data['atas_nama']}*
*Kategori : {$data['kategori']}*
*Status Cucian : SELESAI*

Segera ambil pakaianmu di tempat. 
Terima kasih telah memilih layanan kami :)

admin washwes by @{$data['nama_admin']}";

		$response = Http::post('http://wa.faycook.my.id/send-message', [
			"api_key" => config('utils.WA_API_KEY'),
			"sender" => config('utils.WA_SENDER'),
			"number" => $data['no_wa'],
			"message" => $message
		]);
		return $response;
	}

	public static function notifikasiSelesaiDiantar($data = [])
	{
		$message = "*Halo Pelanggan Washwes*,
Pesanan laundry anda sudah *_SELESAI_* dengan detail pesanan sebagai berikut:

*Nomor Order : {$data['no_order']}*
*Atas Nama : {$data['atas_nama']}*
*Kategori : {$data['kategori']}*
*Status Cucian : SELESAI*

Kami akan segera mengantar cucianmu ke alamat *{$data['alamat']}*. 

Terima kasih telah memilih layanan kami :)

admin washwes by @{$data['nama_admin']}";

		$response = Http::post('http://wa.faycook.my.id/send-message', [
			"api_key" => config('utils.WA_API_KEY'),
			"sender" => config('utils.WA_SENDER'),
			"number" => $data['no_wa'],
			"message" => $message
		]);
		return $response;
	}
	public static function notifikasiSuksesBayar($data = [])
	{
		$message = "*Halo {$data['nama_pelanggan']}*,
Pembayaran kamu telah kami terima dengan detail order sebagai berikut:

*Nomor Order : {$data['no_order']}*
*Atas Nama : {$data['atas_nama']}*
*Kategori : {$data['kategori']}*
*Total Bayar : Rp{$data['total_bayar']}*
*Status Bayar : DIBAYAR*

Terimakasih telah memilih layanan kami!";

		$response = Http::post('http://wa.faycook.my.id/send-message', [
			"api_key" => config('utils.WA_API_KEY'),
			"sender" => config('utils.WA_SENDER'),
			"number" => $data['no_wa'],
			"message" => $message
		]);
		return $response;
	}
}

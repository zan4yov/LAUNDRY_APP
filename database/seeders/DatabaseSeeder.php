<?php

namespace Database\Seeders;

use App\Models\Cucian;
use App\Models\Kategori;
use App\Models\Pembelian;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
	/**
	 * Seed the application's database.
	 */
	public function run(): void
	{
		User::factory()->create([
			'nama' => 'Achmad Alvin Ardiansyah',
			'email' => 'alvin@gmail.com',
			'no_telp' => '62895706077200',
			'no_wa' => '62895706077200',
		]);
		User::factory()->create([
			'nama' => 'Ahmad Thufail',
			'email' => 'tufel@gmail.com',
			'no_telp' => '6281323135707',
			'no_wa' => '6281323135707',
		]);
		User::factory()->create([
			'nama' => 'Daffa Cesario SafiI',
			'email' => 'daffa@gmail.com',
			'no_telp' => '6287881823267',
			'no_wa' => '6287881823267',
		]);
		User::factory()->create([
			'nama' => 'Faturrahman Ardiansyah',
			'email' => 'fatur@gmail.com',
			'no_telp' => '6281279715551',
			'no_wa' => '6281279715551',
		]);
		User::factory()->create([
			'nama' => 'Muhammad Ilham Yahya',
			'email' => 'yahya@gmail.com',
			'no_telp' => '6281230103784',
			'no_wa' => '6281230103784',
		]);

		Kategori::create([
			'nama' => 'CUCI KERING SETRIKA HEMAT',
			'estimasi_hari' => 4,
			'harga' => 3000
		]);
		Kategori::create([
			'nama' => 'CUCI KERING SETRIKA REGULER',
			'estimasi_hari' => 3,
			'harga' => 4500
		]);
		Kategori::create([
			'nama' => 'CUCI KERING SETRIKA EXPRESS',
			'estimasi_hari' => 1,
			'harga' => 10000
		]);
		Kategori::create([
			'nama' => 'CUCI KERING SPREI',
			'estimasi_hari' => 3,
			'harga' => 10000
		]);
		Kategori::create([
			'nama' => 'CUCI KERING SELIMUT',
			'estimasi_hari' => 3,
			'harga' => 12000
		]);

		Pembelian::factory(100)->create();

		User::factory()->create([
			'nama' => 'Joko Widodo',
			'email' => 'jokowi@gmail.com',
			'role' => 'admin',
		]);
		User::factory()->create([
			'nama' => 'Prabowo Subianto',
			'email' => 'prabowo@gmail.com',
			'role' => 'admin',
		]);
		User::factory()->create([
			'nama' => 'Anies Baswedan',
			'email' => 'anies@gmail.com',
			'role' => 'admin',
		]);

		$users = User::where('role', 'pelanggan')->get();
		
		//cucian online
		foreach ($users as $user) {
			//cucian online, ambil sendiri, belum dibayar, status selesai
			Cucian::factory(3)->create([
				'user_id' => $user->id,
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'jenis_order' => 'online',
				'jenis_ambil' => 'ambil sendiri',
				'ongkir_jemput' => 2000,
				'ongkir_antar' => 0,
				'wkt_selesai' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'selesai',
				'status_bayar' => 'belum dibayar',
			]);

			//cucian online, diantar, belum dibayar, status menunggu
			Cucian::factory(2)->create([
				'user_id' => $user->id,
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'jenis_order' => 'online',
				'jenis_ambil' => 'diantar',
				'ongkir_jemput' => 2000,
				'ongkir_antar' => 2000,
				'status_cucian' => 'menunggu',
				'status_bayar' => 'belum dibayar',
				'kategori_id' => rand(1, 5),
				'berat' => null,
				'total_harga' => null,
			]);
			//cucian online, diantar, dibayar,
			Cucian::factory(8)->create([
				'user_id' => $user->id,
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'jenis_order' => 'online',
				'jenis_ambil' => 'diantar',
				'ongkir_jemput' => 2000,
				'ongkir_antar' => 2000,
				'wkt_selesai' => fake()->dateTimeBetween('now', '+1 week'),
				'wkt_diambil' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'diambil',
				'status_bayar' => 'dibayar',
			]);
			//cucian online, ambil sendiri, belum dibayar, status diproses
			Cucian::factory(2)->create([
				'user_id' => $user->id,
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'jenis_order' => 'online',
				'jenis_ambil' => 'ambil sendiri',
				'ongkir_jemput' => 2000,
				'ongkir_antar' => 0,
				'estimasi' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'diproses',
				'status_bayar' => 'belum dibayar',
			]);
			//cucian online, diantar, belum dibayar, status selesai
			Cucian::factory(2)->create([
				'user_id' => $user->id,
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'jenis_order' => 'online',
				'jenis_ambil' => 'diantar',
				'ongkir_jemput' => 2000,
				'ongkir_antar' => 2000,
				'wkt_selesai' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'selesai',
				'status_bayar' => 'belum dibayar',
			]);
			//cucian online, diantar, belum dibayar, status diproses
			Cucian::factory(2)->create([
				'user_id' => $user->id,
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'jenis_order' => 'online',
				'jenis_ambil' => 'diantar',
				'ongkir_jemput' => 2000,
				'ongkir_antar' => 2000,
				'estimasi' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'diproses',
				'status_bayar' => 'belum dibayar',
			]);
			//cucian online, ambil sendiri, belum dibayar, status menunggu
			Cucian::factory(3)->create([
				'user_id' => $user->id,
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'jenis_order' => 'online',
				'jenis_ambil' => 'ambil sendiri',
				'ongkir_jemput' => 2000,
				'ongkir_antar' => 0,
				'status_cucian' => 'menunggu',
				'status_bayar' => 'belum dibayar',
				'kategori_id' => rand(1, 5),
				'berat' => null,
				'total_harga' => null,
			]);
			//cucian online, ambil sendiri, dibayar,
			Cucian::factory(4)->create([
				'user_id' => $user->id,
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'jenis_order' => 'online',
				'jenis_ambil' => 'ambil sendiri',
				'ongkir_jemput' => 2000,
				'ongkir_antar' => 0,
				'wkt_selesai' => fake()->dateTimeBetween('now', '+1 week'),
				'wkt_diambil' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'diambil',
				'status_bayar' => 'dibayar',
			]);
		}

		//cucian offline
		foreach ($users as $user) {
			//cucian offline, diantar, belum bayar, status diproses/selesai
			Cucian::factory(2)->create([
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'user_id' => null,
				'jenis_order' => 'offline',
				'jenis_ambil' => 'diantar',
				'ongkir_antar' => 2000,
				'ongkir_jemput' => 0,
				'estimasi' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'diproses',
				'status_bayar' => 'belum dibayar',
			]);
			//cucian offline, diantar, belum bayar, status diproses
			Cucian::factory(3)->create([
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'user_id' => null,
				'jenis_order' => 'offline',
				'jenis_ambil' => 'diantar',
				'ongkir_antar' => 2000,
				'ongkir_jemput' => 0,
				'estimasi' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'diproses',
				'status_bayar' => 'belum dibayar',
			]);
			//cucian offline, diantar, dibayar,
			Cucian::factory(4)->create([
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'user_id' => null,
				'jenis_order' => 'offline',
				'jenis_ambil' => 'diantar',
				'ongkir_jemput' => 0,
				'ongkir_antar' => 2000,
				'wkt_selesai' => fake()->dateTimeBetween('now', '+1 week'),
				'wkt_diambil' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'diambil',
				'status_bayar' => 'dibayar',
			]);
			//cucian offline, ambil sendiri, belum dibayar, status selesai
			Cucian::factory(3)->create([
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'user_id' => null,
				'jenis_order' => 'offline',
				'jenis_ambil' => 'ambil sendiri',
				'ongkir_antar' => 0,
				'ongkir_jemput' => 0,
				'wkt_selesai' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'selesai',
				'status_bayar' => 'belum dibayar',
			]);
			//cucian offline, diantar, belum dibayar, status selesai
			Cucian::factory(4)->create([
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'user_id' => null,
				'jenis_order' => 'offline',
				'jenis_ambil' => 'diantar',
				'ongkir_antar' => 0,
				'ongkir_jemput' => 0,
				'wkt_selesai' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'selesai',
				'status_bayar' => 'belum dibayar',
			]);
			//cucian offline, ambil sendiri, belum dibayar, status diproses
			Cucian::factory(2)->create([
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'user_id' => null,
				'jenis_order' => 'offline',
				'jenis_ambil' => 'ambil sendiri',
				'ongkir_antar' => 0,
				'ongkir_jemput' => 0,
				'estimasi' => fake()->dateTimeBetween('now', '+1 week'),
				'status_cucian' => 'diproses',
				'status_bayar' => 'belum dibayar',
			]);
			//cucian offline, ambil sendiri, dibayar,
			Cucian::factory(4)->create([
				'alamat_antar' => $user->alamat,
				'no_telp' => $user->no_telp,
				'no_wa' => $user->no_wa,
				'user_id' => null,
				'jenis_order' => 'offline',
				'jenis_ambil' => 'ambil sendiri',
				'ongkir_antar' => 0,
				'ongkir_jemput' => 0,
				'status_cucian' => 'diambil',
				'wkt_diambil' => fake()->dateTimeBetween('now', '+1 week'),
				'wkt_selesai' => fake()->dateTimeBetween('now', '+1 week'),
				'status_bayar' => 'dibayar',
			]);
		}
	}
}

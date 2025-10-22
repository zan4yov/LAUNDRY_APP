<?php

namespace Database\Factories;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Pembelian>
 */
class PembelianFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
				'kode_beli' =>Str::of(Str::random(10))->lower(),
            'wkt_beli' => Carbon::now()->subMinutes(rand(1, 55)),
				'jenis_bahan' => fake()->randomElement(['detergen', 'pewangi', 'pelembut', 'pemutih']),
				'merk' => fake()->company(),
				'jumlah_beli' => fake()->numberBetween(5, 100),
				'total_harga' => fake()->numberBetween(100000, 10000000),
        ];
    }
}

<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Cucian>
 */
class CucianFactory extends Factory
{
	/**
	 * Define the model's default state.
	 *
	 * @return array<string, mixed>
	 */
	public function definition(): array
	{
		return [
			'no_order' => Str::of(Str::random(10))->lower(),
			'no_wa' => fake()->phoneNumber,
			'no_telp' => fake()->phoneNumber,
			'kategori_id' => rand(1, 5),
			'user_id' => rand(1, 5),
			'atas_nama' => fake()->name(),
			'wkt_order' => now(),
			'alamat_antar' => fake()->address,
			'berat' => fake()->numberBetween(1, 10),
			'total_harga' => fake()->numberBetween(10000, 100000),
		];
	}
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('cucian', function (Blueprint $table) {
            $table->id();
				$table->string('no_order', 10);
				$table->foreignId('kategori_id')->nullable();
				$table->foreignId('user_id')->nullable();
				$table->string('atas_nama')->nullable();
				$table->string('snap_token')->nullable();
				$table->string('no_telp')->nullable();
				$table->string('no_wa')->nullable();
				$table->enum('jenis_order',['online','offline']);
				$table->enum('jenis_ambil',['diantar','ambil sendiri']);
				$table->double('ongkir_antar')->nullable()->default(0);
				$table->double('ongkir_jemput')->nullable()->default(0);
				$table->timestamp('wkt_order');
				$table->timestamp('estimasi')->nullable();
				$table->timestamp('wkt_selesai')->nullable();
				$table->timestamp('wkt_diambil')->nullable();
				$table->string('alamat_antar')->nullable();
				$table->double('berat')->nullable();
				$table->double('total_harga')->nullable();
				$table->enum('status_cucian',['menunggu','diproses','selesai','diambil']);
				$table->enum('status_bayar',['dibayar','belum dibayar']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cucian');
    }
};

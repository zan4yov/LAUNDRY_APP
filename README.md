# 🧺 Laravel Laundry Web APP

Sistem manajemen laundry modern berbasis **Laravel 11**, dirancang untuk membantu pengelolaan transaksi, pelanggan, dan layanan laundry secara efisien.  
Proyek ini juga dilengkapi dengan integrasi **Midtrans** untuk pembayaran online, autentikasi menggunakan **Laravel Sanctum**, dan struktur standar Laravel untuk kemudahan pengembangan.

---

## 🚀 Fitur Utama

- **Manajemen Pelanggan & Transaksi** — Tambah, ubah, dan pantau pesanan pelanggan.  
- **Integrasi Pembayaran Midtrans** — Mendukung pembayaran otomatis via Midtrans API.  
- **Autentikasi Aman** — Menggunakan Laravel Sanctum untuk token-based authentication.  
- **Database Otomatis** — Migrasi otomatis saat instalasi awal proyek.  
- **Testing Siap Pakai** — Dukungan unit testing melalui PHPUnit & Mockery.  
- **Development Tools** — Dilengkapi dengan Laravel Sail (Docker-based local environment) dan Laravel Pint untuk format kode otomatis.

---

## 🧰 Teknologi yang Digunakan

| Komponen | Versi / Library |
|-----------|----------------|
| **Framework** | Laravel 11 |
| **PHP Version** | ^8.2 |
| **Auth System** | Laravel Sanctum |
| **Payment Gateway** | Midtrans PHP SDK |
| **Testing Tools** | PHPUnit, Mockery |
| **Code Style** | Laravel Pint |
| **Environment** | Laravel Sail (Docker) |

---

## 📦 Instalasi

1. **Clone repositori**
   ```bash
   git clone https://github.com/zan4yov/Laundry_APP.git
   cd Laundry_APP
   ```

2. **Instal dependensi**
   ```bash
   composer install
   ```

3. **Salin file environment**
   ```bash
   cp .env.example .env
   ```

4. **Generate app key**
   ```bash
   php artisan key:generate
   ```

5. **Konfigurasi database**  
   Buka `.env` dan atur koneksi database sesuai kebutuhan, contoh:
   ```env
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=laundry
   DB_USERNAME=root
   DB_PASSWORD=
   ```

6. **Jalankan migrasi dan seeder (opsional)**
   ```bash
   php artisan migrate --seed
   ```

7. **Jalankan server lokal**
   ```bash
   php artisan serve
   ```
   Akses di: [http://localhost:8000](http://localhost:8000)

---

## 💳 Integrasi Midtrans

Untuk mengaktifkan pembayaran online:
1. Daftar di [Midtrans Dashboard](https://dashboard.midtrans.com/).  
2. Ambil **Server Key** dan **Client Key**.  
3. Tambahkan ke file `.env`:
   ```env
   MIDTRANS_SERVER_KEY=your_server_key
   MIDTRANS_CLIENT_KEY=your_client_key
   MIDTRANS_IS_PRODUCTION=false
   ```

---

## 🧪 Testing

Jalankan pengujian menggunakan PHPUnit:
```bash
php artisan test
```

---

## 🐳 Laravel Sail (opsional)

Untuk menjalankan dengan Docker:
```bash
./vendor/bin/sail up
```
Kemudian akses melalui [http://localhost](http://localhost)

---

## 📄 Lisensi

Proyek ini menggunakan lisensi **MIT** — silakan gunakan, ubah, dan distribusikan dengan bebas sesuai kebutuhan.

# Spotify App

## Pengembang

- **Nama:** Firman Fadilah Noor
- **NIM:** 240605110083
- **Kelas:** F
- **Mata Kuliah:** Mobile Programming Praktikum
- **Dosen Pengampu:** Khadijah Fahmi Hayati Holle, S.Kom., M.Kom

# Spotify App

Aplikasi **Spotify App** merupakan aplikasi pemutar musik sederhana berbasis Flutter yang menampilkan daftar lagu menggunakan API iTunes. Aplikasi ini dikembangkan sebagai bagian dari tugas UTS Mobile Programming.

## Deskripsi Singkat

File `home_page.dart` berfungsi menampilkan berbagai daftar lagu berdasarkan kategori, yaitu:

- Made for You
- Popular Indonesia Singer
- Taylor Swift Collection
- Top Lyodra Song
- Top NIKI Song
- Lagu Pilihan Kamu

Kategori **Lagu Pilihan Kamu** ditambahkan untuk menampilkan lagu-lagu pilihan dari Raim Laode dan The 1975.

Daftar lagu yang ditambahkan meliputi:

- Dunia Yang Nanti — Raim Laode
- Iqro — Raim Laode
- Bersenja Gurau — Raim Laode
- Lesung Pipi — Raim Laode
- Menari-nari — Raim Laode
- About You — The 1975

Selain itu, halaman `music_player_page.dart` digunakan untuk menyediakan fitur pemutar musik dan interaksi pengguna.

## Fitur Utama

### 1. Menampilkan Lagu dari API iTunes

Aplikasi mengambil informasi lagu berdasarkan kata kunci pencarian menggunakan fungsi `ItunesApi.fetchSongs()`. Data yang diperoleh digunakan untuk menampilkan judul lagu, nama artis, dan gambar album.

### 2. Kategori Lagu

Aplikasi menyediakan beberapa kategori lagu, termasuk kategori tambahan **Lagu Pilihan Kamu** yang berisi lagu-lagu pilihan dari Raim Laode dan The 1975.

### 3. Pemutar Musik Interaktif

Halaman `MusicPlayerPage` menyediakan antarmuka pemutar musik dengan kontrol seperti play, pause, next, dan previous. Pemutaran audio bergantung pada ketersediaan sumber audio yang digunakan.

### 4. Fitur Like dan Playlist

Pengguna dapat menyukai lagu dan mengelola lagu ke dalam playlist melalui `LikeManager` dan `PlaylistManager`.

### 5. Navigasi Antarhalaman

Aplikasi menggunakan mekanisme navigasi Flutter, termasuk `Navigator.push()`, untuk berpindah dari halaman utama menuju halaman pemutar musik. Navigasi ke halaman lain mengikuti implementasi yang tersedia di dalam proyek.

### 6. Tema Dinamis

Aplikasi menyediakan tampilan dengan tema terang (*Light Mode*) dan tema gelap (*Dark Mode*) sesuai konfigurasi tema yang diterapkan.

## Penjelasan Kode Utama

### 1. `ItunesApi.fetchSongs()`

Fungsi ini digunakan untuk mengambil data lagu dari API iTunes berdasarkan kata kunci pencarian.

Contoh:

```dart
final songs = await ItunesApi.fetchSongs("Taylor Swift");
```

Untuk mengambil lagu pilihan, aplikasi menggunakan pencarian berdasarkan nama artis atau judul lagu.

### 2. `HomePage`

Halaman utama menampilkan daftar lagu dalam beberapa kategori. Setiap kategori disajikan dalam bentuk daftar horizontal yang menampilkan gambar album, judul lagu, dan nama artis.

Kategori tambahan `Lagu Pilihan Kamu` digunakan untuk menampilkan lagu-lagu yang telah dipilih.

### 3. `MusicPlayerPage`

Halaman ini digunakan untuk menampilkan antarmuka pemutar musik dan menyediakan kontrol pemutaran lagu, seperti play, pause, next, dan previous.

### 4. `LikeManager` dan `PlaylistManager`

Kedua komponen ini menggunakan Provider untuk membantu pengelolaan state aplikasi.

- `LikeManager` mengelola daftar lagu yang disukai pengguna.
- `PlaylistManager` mengelola data lagu yang ditambahkan ke playlist.

### 5. `Navigator.push()`

Mekanisme ini digunakan untuk membuka halaman pemutar musik ketika pengguna memilih lagu dari halaman utama.

## Desain Tampilan

Antarmuka aplikasi menggunakan tata letak yang disusun dengan widget Flutter. Halaman utama menampilkan kategori lagu dalam daftar horizontal sehingga pengguna dapat menjelajahi koleksi lagu dengan mudah.

Setiap item lagu menampilkan gambar album, judul lagu, dan nama artis. Tampilan juga mengikuti tema terang atau gelap sesuai konfigurasi aplikasi.

## Pengembangan Selanjutnya

Pengembangan berikutnya dapat mencakup penyempurnaan pencarian lagu, penanganan lagu yang tidak tersedia pada API, peningkatan pengalaman pemutaran audio, serta pengujian seluruh fitur agar berjalan sesuai harapan.

**Catatan:** Lagu yang ditampilkan bergantung pada hasil pencarian API iTunes. Tidak semua lagu selalu tersedia, dan pemutaran audio bergantung pada ketersediaan preview atau sumber audio yang digunakan aplikasi.

# SOAL TEST PRAKTIKAL: DASAR-DASAR FLUTTER
## PT SOLUSI INFOTECH SEMESTA INDONESIA

---

## TUGAS 1

### Detail: Referensi Figma
Buatlah tampilan apps sesuai dengan tampilan diatas.

**Spesifikasi:**
- Implementasi UI sesuai dengan design Figma yang diberikan
- Tampilan harus responsive dan menarik
- Gunakan widget Flutter yang sesuai untuk setiap komponen

---

## TUGAS 2

### Tujuan
Menilai kemampuan Anda dalam membangun aplikasi mobile yang responsif dan interaktif dengan Flutter, memanfaatkan data dari API.

### Tugas
Anda diminta untuk membuat sebuah aplikasi mobile Android sederhana dengan Flutter yang menampilkan daftar data yang diambil dari API yang telah kami sediakan. Aplikasi ini harus memiliki fitur-fitur berikut:

#### Fitur yang Harus Diimplementasikan:

1. **Lazy loading**: Data dari API harus dimuat secara lazy load.
2. **Pull-to-refresh**: Aplikasi harus menyediakan fitur pull-to-refresh yang memungkinkan pengguna untuk memperbarui data secara manual dengan gesture swipe ke bawah.
3. **Shimmer effect**: Selama proses fetching data, tampilkan animasi shimmer effect sebagai placeholder untuk memberikan pengalaman pengguna yang lebih baik.
4. **UI List**: Anda bebas berkreasi dalam mendesain tampilan UI untuk menampilkan daftar data. Anda dapat menggunakan bentuk card, list, atau bentuk lain yang menurut Anda menarik.

### API Information
**Endpoint**: `https://api.escuelajs.co/api/v1/products?offset=0&limit=10`

**Dokumentasi API**: [https://fakeapi.platzi.com/en/rest/products/#pagination](https://fakeapi.platzi.com/en/rest/products/#pagination)

#### Kriteria Penilaian:
1. **Fungsionalitas**: Aplikasi Anda berfungsi sesuai dengan spesifikasi yang telah kami berikan.
2. **Performa**: Aplikasi Anda responsif, cepat, dan tidak mengalami lag atau error.
3. **Kode**: Kode Anda bersih, terstruktur dengan baik, mudah dibaca, dan mengikuti best practice Flutter.
4. **UI/UX**: Antarmuka aplikasi Anda menarik, mudah digunakan, dan memberikan pengalaman pengguna yang baik.

---

## TUGAS 3

### Tujuan
Menilai kemampuan Anda dalam membangun aplikasi TODO list sederhana yang menerapkan state management untuk mengelola data tugas dengan fitur-fitur berikut:

### Tugas
Anda diminta untuk membangun aplikasi TODO list dengan fitur-fitur berikut:

#### Fitur yang Harus Diimplementasikan:

1. **Menambahkan Tugas Baru**: Terdapat input field untuk memasukkan deskripsi tugas. Terdapat tombol "Tambah" untuk menambahkan tugas ke daftar tugas yang ditambahkan akan memiliki status default "Belum Selesai".

2. **Menampilkan Daftar Tugas**: Menampilkan daftar tugas yang telah ditambahkan dalam bentuk list item yang menampilkan: Deskripsi tugas, Status tugas ("Selesai" atau "Belum Selesai"). Terdapat checkbox atau tombol pada setiap item tugas untuk menghapusnya dari daftar.

3. **Menghapus Tugas**: Terdapat tombol atau ikon "Hapus" pada setiap item tugas untuk menghapusnya dari daftar.

4. **Filter Tugas**: Terdapat pilihan filter untuk menampilkan: Semua tugas, Tugas yang sudah selesai, Tugas yang belum selesai. Pastikan filter bekerja dengan baik dan menampilkan daftar tugas yang sesuai.

#### Kriteria Penilaian:

1. **Fungsionalitas**: Aplikasi berfungsi sesuai spesifikasi, semua fitur bekerja dengan baik dan interaksi dengan UI lancar. State management (Provider, BLoC, Cubit, Riverpod, atau lainnya).

2. **State aplikasi** (daftar tugas, status filter) dikelola dengan baik dan efisien. Perubahan data (menambah, mengubah status, menghapus tugas) dapat berjalan dengan tepat tercermin dengan tepat pada tampilan list.

3. **Kode Anda terstruktur** dengan rapi, mudah dipahami, dan mengikuti best practice state management.

4. **UI/UX**: Desain UI Anda sederhana, bersih, dan mudah digunakan. Aplikasi responsif dan nyaman digunakan.

### Catatan:
- Anda bebas menggunakan library atau package Dart/Flutter yang Anda perlukan.
- Jelaskan secara singkat di README.md alasan Anda memilih metode state management yang digunakan dan bagaimana Anda mengimplementasikannya pada aplikasi.

---

## State Management Implementation

*[Bagian ini akan diisi setelah implementasi selesai]*

### Metode State Management yang Dipilih
*Jelaskan metode state management yang dipilih (Provider, BLoC, Cubit, Riverpod, dll) dan alasan pemilihannya.*

### Implementasi
*Jelaskan bagaimana state management diimplementasikan dalam aplikasi ini.*
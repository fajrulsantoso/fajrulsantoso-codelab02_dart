
# Hello Word - Flutter Project

## Praktikum 3: Membuat Repository GitHub dan Laporan Praktikum

Login ke akun GitHub Anda, lalu buat repository baru dengan nama "flutter-fundamental-part1"
Lalu klik tombol "Create repository" lalu akan tampil seperti gambar berikut.
Langkah 3:
Kembali ke VS code, project flutter hello_world, buka terminal pada menu Terminal > New Terminal. Lalu ketik perintah berikut untuk inisialisasi git pada project Anda.
Langkah 4:
Pilih menu Source Control di bagian kiri, lalu lakukan stages (+) pada file .gitignore untuk mengunggah file pertama ke repository GitHub.
git init
Langkah 5:
Beri pesan commit "tambah gitignore" lalu klik Commit (✔)
Langkah 6:
Lakukan push dengan klik bagian menu titik tiga > Push

Langkah 7:
Di pojok kanan bawah akan tampil seperti gambar berikut. Klik "Add Remote"
Langkah 8:
Salin tautan repository Anda dari browser ke bagian ini, lalu klik Add remote
Langkah 9:
Lakukan hal yang sama pada file README.md mulai dari Langkah 4. Setelah berhasil melakukan push, masukkan username GitHub Anda dan password berupa token yang telah dibuat (pengganti password konvensional ketika Anda login di browser GitHub). Reload halaman repository GitHub Anda, maka akan tampil hasil push kedua file tersebut seperti gambar berikut.

Langkah 10:
Lakukan push juga untuk semua file lainnya dengan pilih Stage All Changes. Beri pesan commit "project hello_world". Maka akan tampil di repository GitHub Anda seperti berikut.

Langkah 11:
Kembali ke VS Code, ubah platform di pojok kanan bawah ke emulator atau device atau bisa juga menggunakan browser Chrome. Lalu coba running project hello_world dengan tekan F5 atau Run > Start Debugging. Tunggu proses kompilasi hingga selesai, maka aplikasi flutter pertama Anda akan tampil seperti berikut.

Langkah 12:
Silakan screenshot seperti pada Langkah 11, namun teks yang ditampilkan dalam aplikasi berupa nama lengkap Anda. Simpan file screenshot dengan nama 01.png pada folder images (buat folder baru jika belum ada) di project hello_world Anda. Lalu ubah isi README.md seperti berikut, sehingga tampil hasil screenshot pada file README.md. Kemudian push ke repository Anda.

##  Praktikum 4: Menerapkan Widget Dasar
Langkah 1: Text Widget Buat folder baru basic_widgets di dalam folder lib. Kemudian buat file baru di dalam basic_widgets dengan nama text_widget.dart. Ketik atau salin kode program berikut ke project hello_world Anda pada file text_widget.dart.


### 💻 Source Code  
```dart
import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
const MyTextWidget({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return const Text(
  "Nama fajrul santoso, sedang belajar Pemrograman Mobile",
  style: TextStyle(color: Colors.red, fontSize: 14),
  textAlign: TextAlign.center);
}
}
```

---
Lakukan import file text_widget.dart ke main.dart, lalu ganti bagian text widget dengan kode di atas. Maka hasilnya seperti gambar berikut. Screenshot hasil milik Anda, lalu dibuat laporan pada file README.md.

## Jawaban


Langkah 2: Image Widget Buat sebuah file image_widget.dartdi dalam folder basic_widgets dengan isi kode berikut.


### 💻 Source Code  
```dart
import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("images/IamProgrammerEnglish.png")
    );
  }
}
```

---
Lakukan penyesuaian asset pada file pubspec.yaml dan tambahkan file logo Anda di folder assets project hello_world.
### 💻 Source Code  
```dart
flutter:
  assets:
    - images/
```

---


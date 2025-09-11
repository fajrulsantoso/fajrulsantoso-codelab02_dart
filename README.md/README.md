Codelab 02 - Bahasa Pemrograman Dart (Polinema)

Repository ini berisi hasil praktikum dari **Codelab 02: Pengantar Bahasa Pemrograman Dart Bagian 1**.  
Struktur repository:
- `src/` → berisi file kode Dart untuk setiap soal
- `img/` → berisi screenshot hasil eksekusi program
- `README.md` → berisi jawaban soal & penjelasan hasil

---

 Jawaban Soal
 Soal 2  
Mengapa penting memahami bahasa Dart sebelum menggunakan Flutter?**

- Flutter dibangun menggunakan bahasa Dart, sehingga pemahaman Dart menjadi dasar sebelum masuk ke Flutter.  
- Konsep seperti variabel, kontrol alur (if, for, while), fungsi, class, dan null safety di Dart sangat penting untuk dipahami agar tidak bingung ketika digunakan di Flutter.  
- Tanpa pemahaman Dart, developer akan kesulitan memahami widget, state management, serta debugging di Flutter.  

---
 Soal 3  
Rangkuman materi Codelab 02 Dart:**

1. Dart adalah bahasa utama Flutter.  
2. Struktur program dimulai dari fungsi `main()`.  
3. `print()` digunakan untuk menampilkan output.  
4. Flutter menggunakan widget untuk membangun UI.  
5. Hot Reload & Hot Restart mempercepat development.  
6. State management penting untuk data dinamis.  
7. Null Safety mencegah error karena nilai `null`.

Hasil eksekusi kode (`soal3.dart`):**  
Hasil Soal 3img/soal3.PNG

---

 Soal 4  
Perbedaan Null Safety dan Late Variable**

Null Safety (`?`)**  
  - Variabel dapat menyimpan `null`.  
  - Contoh: `String? nama;`  
  - Membantu mencegah error ketika nilai belum ada.  

-Late Variable (`late`)**  
  - Inisialisasi ditunda, tapi wajib diisi sebelum digunakan.  
  - Jika digunakan tanpa diisi terlebih dahulu → runtime error.  

Kode (soal4.dart):**
```dart
void main() {
  print("=== Perbedaan Null Safety dan Late Variable ===");

  // Null Safety
  String? nama;
  nama = null;
  print("Null Safety: nilai nama = $nama");

  if (nama == null) {
    print("Null Safety mencegah error karena variabel bisa null.");
  }

  // Late Variable
  late String alamat;
  alamat = "Malang";
  print("Late Variable: nilai alamat = $alamat");

  print("Perbedaan:");
  print("1. Null Safety → variabel bisa null (ditandai dengan '?').");
  print("2. Late Variable → ditunda inisialisasinya, tapi wajib diisi sebelum dipakai.");
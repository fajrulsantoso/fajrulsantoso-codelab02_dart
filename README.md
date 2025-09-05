# 📘 Codelab 02 - Bahasa Pemrograman Dart (Polinema)

![GitHub repo size](https://img.shields.io/github/repo-size/fajrulsantoso/fajrulsantoso-codelab02_dart?color=blue)
![GitHub language count](https://img.shields.io/github/languages/count/fajrulsantoso/fajrulsantoso-codelab02_dart)
![GitHub top language](https://img.shields.io/github/languages/top/fajrulsantoso/fajrulsantoso-codelab02_dart?color=yellow)
![GitHub last commit](https://img.shields.io/github/last-commit/fajrulsantoso/fajrulsantoso-codelab02_dart?color=brightgreen)

Repository ini berisi hasil praktikum dari **Codelab 02: Pengantar Bahasa Pemrograman Dart Bagian 1**.

---

## 👤 Data Diri
- **Nama**   : Fajrul Santoso  
- **Kelas**  : TI-3H  
- **Kampus** : Politeknik Negeri Malang (Polinema)  
- **Tahun**  : 2025  

---

## 📂 Struktur Repository

---

## ✨ Soal 2  
### Mengapa penting memahami bahasa Dart sebelum menggunakan Flutter?

- Flutter dibangun menggunakan bahasa Dart → pemahaman Dart menjadi dasar sebelum masuk ke Flutter.  
- Konsep seperti **variabel, kontrol alur (if, for, while), fungsi, class, dan null safety** di Dart sangat penting agar tidak bingung ketika digunakan di Flutter.  
- Tanpa pemahaman Dart, developer akan kesulitan memahami **widget, state management, serta debugging** di Flutter.  

---

## ✨ Soal 3  
### Rangkuman materi Codelab 02 Dart:
1. Dart adalah bahasa utama Flutter.  
2. Struktur program dimulai dari fungsi `main()`.  
3. `print()` digunakan untuk menampilkan output.  
4. Flutter menggunakan **widget** untuk membangun UI.  
5. **Hot Reload & Hot Restart** mempercepat development.  
6. **State management** penting untuk data dinamis.  
7. **Null Safety** mencegah error karena nilai `null`.  

📸 **Hasil eksekusi kode (soal3.dart):**  
![Hasil Soal 3](./img/soal3.PNG)  

---

## ✨ Soal 4  
### Perbedaan Null Safety dan Late Variable  

**🔹 Null Safety (`?`)**  
- Variabel dapat menyimpan `null`.  
- Contoh:  
  ```dart
  String? nama;
  nama = null;

void main() {
  // Deklarasi awal variabel 'test' dengan nilai "test2"
  String test = "test2";

  // Cek nilai test
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }

  // Cek ulang apakah test bernilai "test2"
  if (test == "test2") {
    print("Test2 again");
  }

  // ❌ ERROR jika kita membuat lagi variabel dengan nama 'test'
  // String test = "true"; // <-- Jangan lakukan ini

  // ❌ ERROR: Tidak bisa menggunakan String sebagai kondisi if
  // if (test) {
  //   print("Kebenaran");
  // }

  // ✅ Solusi: Gunakan tipe data boolean
  bool isTrue = true;

  // Cek apakah isTrue bernilai true
  if (isTrue) {
    print("Kebenaran");
  }

  // Tambahan logika: misalnya nilai ujian
  int nilai = 85;

  // Cek apakah nilai lebih besar dari atau sama dengan 80
  if (nilai >= 80) {
    print("Nilai bagus");
  }
}

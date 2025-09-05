void main() {
  print("=== Perbedaan Null Safety dan Late Variable ===");

  // 🔹 Null Safety
  String? nama; // boleh null karena ada tanda '?'
  nama = null;
  print("Null Safety: nilai nama = $nama");

  // Jika kita akses tanpa pengecekan bisa error,
  // jadi biasanya dicek dulu:
  if (nama == null) {
    print("Null Safety mencegah error karena variabel bisa null.");
  }

  // 🔹 Late Variable
  late String alamat; // harus diinisialisasi sebelum dipakai
  alamat = "Malang";
  print("Late Variable: nilai alamat = $alamat");

  // Kalau late variable dipakai sebelum diinisialisasi → runtime error
  // Contoh (jangan dijalankan):
  // late String umur;
  // print(umur); // ERROR karena belum diisi

  print("Perbedaan:");
  print("1. Null Safety → variabel bisa null (ditandai dengan '?').");
  print(
    "2. Late Variable → ditunda inisialisasinya, tapi wajib diisi sebelum dipakai.",
  );
}

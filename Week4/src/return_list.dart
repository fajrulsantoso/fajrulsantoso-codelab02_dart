// Return multiple value menggunakan List
List<int> hitung(int a, int b) {
  return [a + b, a - b, a * b];
}

void main() {
  var hasil = hitung(5, 3);
  print("Tambah: ${hasil[0]}");
  print("Kurang: ${hasil[1]}");
  print("Kali: ${hasil[2]}");
}

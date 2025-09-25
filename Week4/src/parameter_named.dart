// Named parameter (dibungkus {} dengan default value)
void info({String nama = "Guest", int umur = 0}) {
  print("Nama: $nama, Umur: $umur");
}

void main() {
  info(nama: "Andi", umur: 20);
  info(); // pakai default
}

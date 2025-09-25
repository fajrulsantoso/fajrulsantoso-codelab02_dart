// Optional positional parameter (dibungkus [])
void salam(String nama, [String? pesan]) {
  print("Hai $nama ${pesan ?? ''}");
}

void main() {
  salam("Budi");
  salam("Budi", "Selamat pagi!");
}

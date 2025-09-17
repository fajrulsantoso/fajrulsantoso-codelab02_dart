void main() {
  String nama = "fajrulsantoso"; // Ganti dengan nama lengkapmu
  String nim = "244107023010"; // Ganti dengan NIM-mu

  for (int number = 2; number <= 201; number++) {
    if (isPrime(number)) {
      print("$number adalah bilangan prima.");
      print("Nama: $nama");
      print("NIM: $nim");
      print("---------------------");
    }
  }
}

// Fungsi untuk cek bilangan prima
bool isPrime(int num) {
  if (num < 2) return false;

  for (int i = 2; i <= num ~/ 2; i++) {
    if (num % i == 0) return false;
  }

  return true;
}

// Functions sebagai First-Class Objects
void kali(int x) => print("Hasil kali: ${x * 2}");

void jalankan(Function f, int value) {
  f(value);
}

void main() {
  var fn = kali; // simpan function ke variabel
  fn(5);

  jalankan(kali, 7); // function sebagai parameter
}

// Lexical Closure: function menyimpan variabel dari scope luar
Function buatCounter() {
  int hitung = 0;

  return () {
    hitung++;
    return hitung;
  };
}

void main() {
  var counter = buatCounter();

  print(counter()); // 1
  print(counter()); // 2
  print(counter()); // 3
}

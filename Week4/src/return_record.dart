// Return multiple value menggunakan Record (Dart 3)
(int, int) bagiDanSisa(int a, int b) {
  return (a ~/ b, a % b);
}

void main() {
  var (hasilBagi, sisa) = bagiDanSisa(10, 3);
  print("Hasil bagi: $hasilBagi, Sisa: $sisa");
}

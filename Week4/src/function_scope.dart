// Lexical Scope: variabel luar bisa diakses function dalam
void main() {
  var pesan = "Halo dari function_scope.dart";

  void cetakPesan() {
    print(pesan); // akses variabel dari scope luar
  }

  cetakPesan();
}

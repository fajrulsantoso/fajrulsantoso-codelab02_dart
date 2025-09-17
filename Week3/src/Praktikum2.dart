// // *void main() {
//   while (counter < 33) {
//     print($counter);
//     counter++;
//   }

//  }
// karena menggunakan counter maka harus mendeklarasikan counter
// dibawah ini perbaikan kodenya

void main() {
  int counter = 0; // ✅ Deklarasi dan inisialisasi variabel counter

  while (counter < 33) {
    print(counter); // ✅ Menampilkan nilai counter
    counter++; // ✅ Menambah nilai counter
  }
  do {
    print(counter);
    counter++;
  } while (counter < 77);
}

<!-- *Praktikum 1  

  // ❌ ERROR jika kita membuat lagi variabel dengan nama 'test'
  // String test = "true"; // <-- Jangan lakukan ini

  // ❌ ERROR: Tidak bisa menggunakan String sebagai kondisi if
  // if (test) {
  //   print("Kebenaran");
  // }      
     
  // ✅ Solusi: Gunakan tipe data boolean
  bool isTrue = true;

  // Cek apakah isTrue bernilai true
  if (isTrue) {
    print("Kebenaran");
  }

  // Tambahan logika: misalnya nilai ujian
  int nilai = 85;

  // Cek apakah nilai lebih besar dari atau sama dengan 80
  if (nilai >= 80) {
    print("Nilai bagus");
  }
    


    Praktikum 2
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
    Praktikum 4
    // for (Index = 10; index < 27; index) {
//   print(Index);
// }
// If (Index == 21) break;
// Else If (index > 1 || index < 7) continue;
// print(index);

// karena menggunakan index maka harus mendeklarasikan index
void main() {
  for (int index = 10; index < 27; index++) {
    if (index == 21)
      break;
    else if (index > 1 || index < 7)
      continue;
    print(index);
  }
}
   -->
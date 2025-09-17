void main() {
  for (int index = 10; index < 27; index++) {
    if (index == 21)
      break; // stop kalau sudah 21
    else if (index > 1 && index < 7)
      continue; // lewati angka 2–6 (tapi ini gak kepakai karena mulai dari 10)
    print(index);
  }
}

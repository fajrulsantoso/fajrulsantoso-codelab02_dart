void main() {
  final list = List<dynamic>.filled(5, null);
  list[1] = "fajrul Santoso"; // Nama pada indeks 1
  list[2] = "244107023010"; // NIM pada indeks 2

  print("List: $list");
  print("fajrul santoso: ${list[1]}");
  print("244107023010 2: ${list[2]}");
}

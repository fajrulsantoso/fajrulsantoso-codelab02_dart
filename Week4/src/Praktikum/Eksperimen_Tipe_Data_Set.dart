void main() {
  var halogens = <String>{
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  print("Halogens: $halogens");

  var names1 = <String>{};
  Set<String> names2 = {};

  // Menambahkan elemen ke names1 menggunakan .add()
  names1.add("fajrul santoso"); // Nama
  names1.add("244107023010"); // NIM

  // Menambahkan elemen ke names2 menggunakan .addAll()
  names2.addAll({"fajrul santoso", "244107023010"});

  print("Names1: $names1");
  print("Names2: $names2");
}

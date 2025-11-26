class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      // Aman dari String/null
      id: int.tryParse(json['id']?.toString() ?? '') ?? 0,

      // Jika null -> diganti nilai ramah pengguna
      pizzaName: (json['pizzaName'] ?? 'No name').toString(),

      description: (json['description'] ?? 'No description').toString(),

      // Aman dari String/null
      price: double.tryParse(json['price']?.toString() ?? '') ?? 0.0,

      // Aman dari null
      imageUrl: (json['imageUrl'] ?? '').toString(),
    );
  }
}

import 'package:flutter/material.dart';
import 'navigation_second.dart'; // pastikan file ini diimpor

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  // Warna tema awal
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Fajrul Santoso'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }

  // Fungsi navigasi ke halaman kedua dan menerima warna pilihan
  Future<void> _navigateAndGetColor(BuildContext context) async {
    final selectedColor = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    );

    // Jika pengguna memilih warna, ubah background
    if (selectedColor != null && selectedColor is Color) {
      setState(() {
        color = selectedColor;
      });
    }
  }
}

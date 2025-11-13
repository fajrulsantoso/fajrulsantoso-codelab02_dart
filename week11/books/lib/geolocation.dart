import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // Langkah 2: Tambah variabel Future
  Future<Position>? position;

  // Langkah 3: Tambah initState()
  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  // Langkah 1: Modifikasi method getPosition()
  Future<Position> getPosition() async {
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3)); // simulasi loading
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  // ✅ Langkah 4 & 5: FutureBuilder + Handling Error
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location - Fajrul Santoso')),
      body: Center(
        child: FutureBuilder<Position>(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } 
            // 🔹 Ganti bagian ini dengan kode Langkah 5
            else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 👉 Kode Langkah 5 di sini
                return const Text('Something terrible happened!');
              }
              return Text(snapshot.data.toString());
            } 
            else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}

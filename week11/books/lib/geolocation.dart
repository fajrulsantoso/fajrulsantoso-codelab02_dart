import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // ✅ Langkah 2: Tambah variabel Future
  Future<Position>? position;

  // ✅ Langkah 3: Tambah initState()
  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  // ✅ Langkah 1: Modifikasi method getPosition()
  Future<Position> getPosition() async {
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3)); // simulasi loading
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  // ✅ Langkah 4: Edit method build()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location - Fajrul Santoso')),
      body: Center(
        child: FutureBuilder<Position>(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            // 🔹 Menunggu hasil future
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            // 🔹 Jika future selesai
            else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                );
              } else if (snapshot.hasData) {
                return Text(
                  'Latitude: ${snapshot.data!.latitude}\nLongitude: ${snapshot.data!.longitude}',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                );
              } else {
                return const Text('Tidak ada data lokasi');
              }
            }
            // 🔹 Default (fallback)
            else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}

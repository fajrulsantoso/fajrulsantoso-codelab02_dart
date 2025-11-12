import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulated Location - Fajrul Santoso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getMockPosition();
  }

  Future<Position> getMockPosition() async {
    await Future.delayed(const Duration(seconds: 2)); // simulasi loading
    // Mock: Surabaya
    return Position(
      latitude: -7.24917,
      longitude: 112.75083,
      timestamp: DateTime.now(),
      accuracy: 5.0,
      altitude: 3.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      altitudeAccuracy: 1.0, // ✅ parameter baru
      headingAccuracy: 1.0, // ✅ parameter baru
    );
  }

  void refresh() {
    setState(() {
      position = getMockPosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location (Mock) - Fajrul Santoso'),
        actions: [
          IconButton(onPressed: refresh, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Center(
        child: FutureBuilder<Position>(
          future: position,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 12),
                  Text('Mendapatkan lokasi...'),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              );
            } else if (snapshot.hasData) {
              final pos = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Latitude: ${pos.latitude}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Longitude: ${pos.longitude}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Timestamp: ${pos.timestamp}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              );
            } else {
              return const Text('Tidak ada data lokasi');
            }
          },
        ),
      ),
    );
  }
}

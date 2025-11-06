import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart'; // ✅ Langkah 1: import package async

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fajrul santoso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

  // ✅ Langkah 2: Tambahkan variabel late Completer
  late Completer completer;

  // ✅ Method getNumber() yang mengembalikan Future
  Future getNumber() {
    completer = Completer<int>(); // Membuat objek Completer
    calculate(); // Jalankan proses perhitungan
    return completer.future; // Kembalikan future untuk ditunggu hasilnya
  }

  // ✅ Method calculate() yang akan menyelesaikan Future setelah delay 5 detik
  Future calculate() async {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42); // Menyelesaikan Future dengan nilai 42
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
                getNumber().then((value) {
                  setState(() {
                    result = value.toString(); // tampilkan hasil 42
                  });
                });
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

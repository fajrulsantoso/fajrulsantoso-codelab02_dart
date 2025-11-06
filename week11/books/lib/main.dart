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
  late Completer<int> completer;

  // ✅ Method getNumber() yang mengembalikan Future
  Future<int> getNumber() {
    completer = Completer<int>();
    calculate(); // Jalankan method calculate()
    return completer.future;
  }

  // ✅ Langkah 5: Method calculate() dengan penanganan error
  Future<void> calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 3)); // simulasi proses
      // Aktifkan baris berikut untuk mengetes error:
      throw Exception('Simulasi error');
      // Jika tidak error, kamu bisa ganti dengan:
      // completer.complete(42);
    } catch (e) {
      completer.completeError(e); // Jika error, kirim error ke Future
    }
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
                getNumber()
                    .then((value) {
                      setState(() {
                        result = value
                            .toString(); // tampilkan hasil jika sukses
                      });
                    })
                    .catchError((error) {
                      setState(() {
                        result = 'An error occurred'; // tampilkan jika gagal
                      });
                    });
              },
            ),
            const Spacer(),
            Text(
              result,
              style: const TextStyle(fontSize: 24, color: Colors.red),
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

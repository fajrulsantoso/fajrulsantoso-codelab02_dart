import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart'; // tetap diimpor, meski tidak digunakan langsung

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fajrul Santoso',
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

  // ✅ Future.wait untuk menjalankan beberapa Future sekaligus
  void returnFG() async {
    try {
      final futures = Future.wait<int>([
        returnOneAsync(),
        returnTwoAsync(),
        returnThreeAsync(),
      ]);

      final values = await futures;
      int total = values.reduce((a, b) => a + b);

      setState(() {
        result = total.toString(); // Hasil: 6
      });
    } catch (e) {
      setState(() {
        result = 'Terjadi kesalahan: $e';
      });
    }
  }

  // ✅ Fungsi asynchronous normal
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 1));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 2));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  // ✅ Fungsi untuk uji error
  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // 🔹 Tombol pertama: Future.wait (hasil angka 6)
            ElevatedButton(
              child: const Text('Run Future.wait'),
              onPressed: returnFG,
            ),

            const SizedBox(height: 20),

            // 🔹 Tombol kedua: Uji error Future
            ElevatedButton(
              child: const Text('Run Error Test'),
              onPressed: () {
                returnError()
                    .then((value) {
                      setState(() {
                        result = 'Success';
                      });
                    })
                    .catchError((error) {
                      setState(() {
                        // ✅ tampilkan pesan error di layar
                        result = error.toString();
                      });
                    })
                    .whenComplete(() {
                      print('Complete');
                    });
              },
            ),

            const Spacer(),
            Text(
              result,
              style: const TextStyle(fontSize: 24, color: Colors.red),
              textAlign: TextAlign.center,
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

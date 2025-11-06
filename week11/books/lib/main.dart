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

  // ✅ Method FutureGroup
  void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();

    // Menambahkan 3 Future berbeda dengan waktu 1–3 detik
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();

    futureGroup.future
        .then((List<int> value) {
          int total = 0;
          for (var element in value) {
            total += element;
          }

          setState(() {
            result = total.toString(); // tampilkan hasil penjumlahan
          });
        })
        .catchError((error) {
          // ✅ Tambahkan penanganan error agar tidak muncul "An error occurred"
          setState(() {
            result = 'Terjadi kesalahan: $error';
          });
        });
  }

  // ✅ Fungsi tambahan untuk FutureGroup
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
                returnFG(); // memanggil method FutureGroup
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

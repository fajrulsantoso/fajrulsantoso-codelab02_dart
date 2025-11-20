import 'package:flutter/material.dart';
import 'dart:convert'; // Optional, jika ingin decode JSON menjadi Map/List

void main() {
  runApp(const MyApp());
}

// 💻 Langkah 6: Buat class MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON FAJRUL SANTOSO',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

// 💻 Langkah 6: Buat StatefulWidget MyHomePage
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 💻 Langkah 6: Tambahkan _MyHomePageState
class _MyHomePageState extends State<MyHomePage> {
  // 💻 Langkah 6: Tambahkan variabel pizzaString
  String pizzaString = '';

  // 🚀 Langkah 8: Panggil readJsonFile di initState
  @override
  void initState() {
    super.initState();
    readJsonFile(); // Memanggil method untuk membaca JSON saat widget dibuat
  }

  // 💾 Langkah 7: Tambahkan Method readJsonFile
  Future<void> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');
    setState(() {
      pizzaString = myString;
    });
  }

  // 💻 Langkah 9: Tampilkan hasil JSON di body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter JSON FAJRUL SANTOSO')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: pizzaString.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Text(pizzaString, style: const TextStyle(fontSize: 16)),
              ),
      ),
    );
  }
}

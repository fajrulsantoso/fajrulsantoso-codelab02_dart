import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int appCounter = 0;

  @override
  void initState() {
    super.initState();
    readAndWritePreference();
  }

  Future<void> readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Baca nilai counter sebelumnya
    appCounter = prefs.getInt('appCounter') ?? 0;

    // Tambah setiap kali aplikasi dibuka
    appCounter++;

    // Simpan kembali ke storage
    await prefs.setInt('appCounter', appCounter);

    // Update UI
    setState(() {});
  }

  Future<void> deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Hapus semua data SharedPreferences
    await prefs.clear();

    // Reset UI
    setState(() {
      appCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Preferences Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("You have opened this app $appCounter times."),
            ElevatedButton(
              onPressed: deletePreference,
              child: const Text("Reset counter"),
            ),
          ],
        ),
      ),
    );
  }
}

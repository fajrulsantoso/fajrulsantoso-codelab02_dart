import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter Lengkap',
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
      home: const MyHomePage(title: 'Aplikasi Flutter Lengkap'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _nameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Fungsi untuk Date Picker - DIPERBAIKI
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.red,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Fungsi untuk format tanggal - DIPERBAIKI
  String _formatDate(DateTime date) {
    if (date == null) return 'Pilih tanggal';

    // Method yang lebih aman untuk format tanggal
    try {
      // Format: YYYY-MM-DD
      return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    } catch (e) {
      return 'Format error';
    }
  }

  // Fungsi untuk menampilkan Alert Dialog - DIPERBAIKI
  void _showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Informasi"),
      content: Text(
        "Nama: ${_nameController.text.isNotEmpty ? _nameController.text : 'Belum diisi'}\n"
        "Counter: $_counter\n"
        "Tanggal: ${_formatDate(_selectedDate)}",
      ),
      actions: [okButton],
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Card Profil
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const MyImageWidget(),
                    const SizedBox(height: 16),
                    const MyTextWidget(),
                  ],
                ),
              ),
            ),

            // Card Input Data - DIPERBAIKI
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Data Diri",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nama Lengkap',
                        hintText: 'Masukkan nama Anda',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.red),
                        const SizedBox(width: 8),
                        // Tampilan tanggal yang lebih aman - DIPERBAIKI
                        Text(
                          "Tanggal: ${_formatDate(_selectedDate)}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: () => _selectDate(context),
                          icon: const Icon(Icons.date_range),
                          label: const Text('Pilih Tanggal'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Card Counter
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Counter',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '$_counter',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tekan tombol + di bawah untuk menambah nilai',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            // Card Aksi
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      "Aksi",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Cupertino Activity Indicator
                    const CupertinoActivityIndicator(),
                    const SizedBox(height: 16),

                    // Cupertino Button
                    CupertinoButton(
                      color: Colors.red,
                      child: const Text("Tampilkan Alert"),
                      onPressed: () => _showAlertDialog(context),
                    ),
                    const SizedBox(height: 16),

                    // Elevated Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text("Tampilkan Informasi"),
                      onPressed: () => _showAlertDialog(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: const Center(
            child: Text(
              "Aplikasi Flutter Lengkap - Fajrul Santoso",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Tambah Counter',
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Fajrul Santoso",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Sedang belajar Pemrograman Mobile dengan Flutter 🚀",
          style: TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.red, width: 3),
      ),
      child: ClipOval(
        child: Image.asset(
          "assets/logo_polinema.jpg",
          width: 120,
          height: 120,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 40, color: Colors.grey),
                  Text("Foto Profil"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

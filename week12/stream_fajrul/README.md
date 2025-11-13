# stream_fajrul

## Langkah 1: Buat Project Baru
Buatlah sebuah project flutter baru dengan nama stream_nama (beri nama panggilan Anda) di folder week-12/src/ repository GitHub Anda.

## Langkah 2: Buka file main.dart
Ketiklah kode seperti berikut ini.
### 💻 Source Code  
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

---
## JAWABAN
![Praktikum ](img/P11P1L2.JPG) 

## 1 Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda. 
### 💻 Source Code  
```dart
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAJRUL SANTOSO 11',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const StreamHomePage(),
    );
  }
}

```

---
## 2 Gantilah warna tema aplikasi sesuai kesukaan Anda.
## 3 Lakukan commit hasil jawaban Soal 1 dengan pesan "W12: Jawaban Soal 1"

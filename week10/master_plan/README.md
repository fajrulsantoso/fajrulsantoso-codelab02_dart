**Nama:** Fajrul Santoso  

## Langkah 1: Buat Project Baru
Buatlah sebuah project flutter baru dengan nama master_plan di folder src week-10 repository GitHub Anda atau sesuai style laporan praktikum yang telah disepakati. Lalu buatlah susunan folder dalam project seperti gambar berikut ini.
## JAWABAN
![Praktikum ](img/L1P1.JPG)

## Langkah 2: Membuat model task.dart
Praktik terbaik untuk memulai adalah pada lapisan data (data layer). Ini akan memberi Anda gambaran yang jelas tentang aplikasi Anda, tanpa masuk ke detail antarmuka pengguna Anda. Di folder model, buat file bernama task.dart dan buat class Task. Class ini memiliki atribut description dengan tipe data String dan complete dengan tipe data Boolean, serta ada konstruktor. Kelas ini akan menyimpan data tugas untuk aplikasi kita. Tambahkan kode berikut: 


### 💻 Source Code  
```dart
class Task {
  final String description;
  final bool complete;
  
  const Task({
    this.complete = false,
    this.description = '',
  });
}
```

---
## JAWABAN
![Praktikum ](img/L2P1.JPG)


## Langkah 3: Buat file plan.dart
Kita juga perlu sebuah List untuk menyimpan daftar rencana dalam aplikasi to-do ini. Buat file plan.dart di dalam folder models dan isi kode seperti berikut. 



### 💻 Source Code  
```dart
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;
  
  const Plan({this.name = '', this.tasks = const []});
}
```

---
## JAWABAN


## Langkah 4: Buat file data_layer.dart
Kita dapat membungkus beberapa data layer ke dalam sebuah file yang nanti akan mengekspor kedua model tersebut. Dengan begitu, proses impor akan lebih ringkas seiring berkembangnya aplikasi. Buat file bernama data_layer.dart di folder models. Kodenya hanya berisi export seperti berikut. 


### 💻 Source Code  
```dart
export 'plan.dart';
export 'task.dart';
```

---
## JAWABAN

## Langkah 5: Pindah ke file main.dart
Ubah isi kode main.dart sebagai berikut. 


### 💻 Source Code  
```dart
import 'package:flutter/material.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(primarySwatch: Colors.purple),
     home: PlanScreen(),
    );
  }
}
```

---
## JAWABAN


## Langkah 6: buat plan_screen.dart
Pada folder views, buatlah sebuah file plan_screen.dart dan gunakan templat StatefulWidget untuk membuat class PlanScreen. Isi kodenya adalah sebagai berikut. Gantilah teks ‘Namaku' dengan nama panggilan Anda pada title AppBar.

### 💻 Source Code  
```dart
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    // ganti ‘Namaku' dengan Nama panggilan Anda
    appBar: AppBar(title: const Text('Master Plan Namaku')),
    body: _buildList(),
    floatingActionButton: _buildAddTaskButton(),
   );
  }
}
```

---
## JAWABAN




## Langkah 7: buat method _buildAddTaskButton()
Anda akan melihat beberapa error di langkah 6, karena method yang belum dibuat. Ayo kita buat mulai dari yang paling mudah yaitu tombol Tambah Rencana. Tambah kode berikut di bawah method build di dalam class _PlanScreenState.


### 💻 Source Code  
```dart
Widget _buildAddTaskButton() {
  return FloatingActionButton(
   child: const Icon(Icons.add),
   onPressed: () {
     setState(() {
      plan = Plan(
       name: plan.name,
       tasks: List<Task>.from(plan.tasks)
       ..add(const Task()),
     );
    });
   },
  );
}
```

---
## JAWABAN


## Langkah 8: buat widget _buildList()
Kita akan buat widget berupa List yang dapat dilakukan scroll, yaitu ListView.builder. Buat widget ListView seperti kode berikut ini.


### 💻 Source Code  
```dart
Widget _buildList() {
  return ListView.builder(
   itemCount: plan.tasks.length,
   itemBuilder: (context, index) =>
   _buildTaskTile(plan.tasks[index], index),
  );
}
```

---
## JAWABAN


## Langkah 9: buat widget _buildTaskTile
Dari langkah 8, kita butuh ListTile untuk menampilkan setiap nilai dari plan.tasks. Kita buat dinamis untuk setiap index data, sehingga membuat view menjadi lebih mudah. Tambahkan kode berikut ini.

### 💻 Source Code  
```dart
Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              plan = Plan(
                name: plan.name,
                tasks: List<Task>.from(plan.tasks)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
            });
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
```

---
## JAWABAN
![Praktikum 3](img/l9P1.JPG)


## Langkah 10: Tambah Scroll Controller
Anda dapat menambah tugas sebanyak-banyaknya, menandainya jika sudah beres, dan melakukan scroll jika sudah semakin banyak isinya. Namun, ada salah satu fitur tertentu di iOS perlu kita tambahkan. Ketika keyboard tampil, Anda akan kesulitan untuk mengisi yang paling bawah. Untuk mengatasi itu, Anda dapat menggunakan ScrollController untuk menghapus focus dari semua TextField selama event scroll dilakukan. Pada file plan_screen.dart, tambahkan variabel scroll controller di class State tepat setelah variabel plan.


### 💻 Source Code  
```dart
late ScrollController scrollController;
```

---
## JAWABAN


## Langkah 11: Tambah Scroll Listener
Tambahkan method initState() setelah deklarasi variabel scrollController seperti kode berikut. 

### 💻 Source Code  
```dart
@override
void initState() {
  super.initState();
  scrollController = ScrollController()
    ..addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
}
```

---
## JAWABAN

## Langkah 12: Tambah controller dan keyboard behavior
Tambahkan controller dan keyboard behavior pada ListView di method _buildList seperti kode berikut ini.
### 💻 Source Code  
```dart
return ListView.builder(
  controller: scrollController,
 keyboardDismissBehavior: Theme.of(context).platform ==
 TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
```

---
## JAWABAN


## Langkah 13: Terakhir, tambah method dispose()
Terakhir, tambahkan method dispose() berguna ketika widget sudah tidak digunakan lagi.

### 💻 Source Code  
```dart
@override
void dispose() {
  scrollController.dispose();
  super.dispose();
}
```

---
## JAWABAN
Langkah 14: Hasil
Lakukan Hot restart (bukan hot reload) pada aplikasi Flutter Anda. Anda akan melihat tampilan akhir seperti gambar berikut. Jika masih terdapat error, silakan diperbaiki hingga bisa running.
## JAWABAN
![Praktikum 3](img/L14P1.JPG) 


Tugas Praktikum 1: Dasar State dengan Model-View
## 1Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.
## 2Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?

### 💻 Pada **Langkah 4**, kita membuat kelas `Task` di file `task.dart`:
```dart
class Task {
  final String description;
  final bool complete;

  const Task({
    this.complete = false,
    this.description = '',
  });
}
```

---
## JAWABAN
Langkah ini dilakukan untuk memisahkan data dari tampilan (UI).
Kelas Task berperan sebagai model data, yang menyimpan atribut setiap tugas, seperti:

description → teks deskripsi tugas

complete → status apakah tugas sudah selesai atau belum

Dengan membuat model terpisah, struktur kode menjadi lebih rapi, modular, dan mudah dikembangkan.
Pendekatan ini mengikuti prinsip Model–View separation

## 3Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?
### 💻 Pada **Langkah 4**, kita membuat kelas `Task` di file `task.dart`:
```dart
Plan plan = const Plan(name: 'Rencana Harian');

```

---
## JAWABAN
ariabel plan dibutuhkan karena aplikasi ini tidak hanya menampilkan tugas tunggal, tetapi mengelola daftar banyak tugas (tasks) yang disimpan di dalam objek Plan.
Objek Plan ini bertindak sebagai state utama (sumber kebenaran data) di aplikasi.

Mengapa menggunakan const?

Karena pada saat inisialisasi, data Plan masih statis dan belum berubah.

Flutter menyarankan penggunaan const untuk efisiensi memori pada objek yang tidak berubah.

Setiap kali ada perubahan (seperti menambah atau mengedit tugas), data diubah dengan membuat salinan baru dari Plan menggunakan setState().

## 4Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
### 💻Pada Langkah 9, dibuat widget _buildTaskTile() yang bertugas menampilkan setiap task dalam bentuk ListTile berisi Checkbox dan TextFormField:
```dart
Widget _buildTaskTile(Task task, int index) {
  return ListTile(
    leading: Checkbox(
      value: task.complete,
      onChanged: (selected) {
        setState(() {
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)
              ..[index] = Task(
                description: task.description,
                complete: selected ?? false,
              ),
          );
        });
      },
    ),
    title: TextFormField(
      initialValue: task.description,
      onChanged: (text) {
        setState(() {
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)
              ..[index] = Task(description: text, complete: task.complete),
          );
        });
      },
      decoration: const InputDecoration(
        hintText: 'Tulis deskripsi tugas...',
        border: InputBorder.none,
      ),
    ),
  );
}


```

---
## JAWABAN
Widget ini menampilkan satu baris tugas dengan dua elemen: kotak centang dan kolom teks.

Saat kotak centang diklik atau teks diubah, fungsi setState() dijalankan untuk memperbarui daftar tasks di dalam plan.

UI akan otomatis menyegarkan diri dengan nilai terbaru dari model.
![Praktikum 3](img/l9P1.JPG)


## 5Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
```dart
@override
void initState() {
  super.initState();
  scrollController = ScrollController()
    ..addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
}

```

---
## JAWABAN
Dipanggil saat widget pertama kali dibuat (initialized).

Di sini, ScrollController digunakan untuk mengatur perilaku saat pengguna melakukan scroll pada daftar tugas.

Tujuan listener ini adalah menghapus fokus dari TextField saat daftar di-scroll, agar keyboard otomatis tertutup — terutama untuk pengguna iOS.

```dart
@override
void dispose() {
  scrollController.dispose();
  super.dispose();
}

```

---
## jawaban 
Dipanggil saat widget dihapus dari layar (disposed).

Digunakan untuk membersihkan resource yang digunakan, seperti ScrollController.

Hal ini mencegah memory leak dan menjaga performa aplikasi tetap optimal.

## 6Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !


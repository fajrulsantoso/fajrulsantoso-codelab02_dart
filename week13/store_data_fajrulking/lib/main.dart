import 'package:flutter/material.dart';
import 'dart:convert';
import 'model/pizza.dart';

void main() {
  runApp(const MyApp());
}

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];

  @override
  void initState() {
    super.initState();
    loadPizzas();
  }

  void loadPizzas() async {
    List<Pizza> pizzas = await readJsonFile();
    setState(() {
      myPizzas = pizzas;
    });
  }

  Future<List<Pizza>> readJsonFile() async {
    String jsonString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');

    List<dynamic> pizzaMapList = jsonDecode(jsonString);
    return pizzaMapList.map((json) => Pizza.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter JSON FAJRUL SANTOSO')),
      body: myPizzas.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: myPizzas.length,
              itemBuilder: (context, index) {
                final pizza = myPizzas[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(pizza.pizzaName),
                    subtitle: Text(
                      '${pizza.description}\n\$${pizza.price.toStringAsFixed(2)}',
                    ),
                    leading: const Icon(Icons.local_pizza, size: 40),
                  ),
                );
              },
            ),
    );
  }
}

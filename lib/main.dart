import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Raxa conta"),
      ),
      body: Column(
        children: [
          const Icon(
            Icons.monetization_on,
            size: 120,
            color: Colors.blue,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Quantidade de pessoa",
              labelStyle: TextStyle(color: Colors.blue),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Valor da conta",
              labelStyle: TextStyle(color: Colors.blue),
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          const Text(
            "Valor por pessoa",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}

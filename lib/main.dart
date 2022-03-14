import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
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
  var quantidadePessoaController = TextEditingController();
  var valorContaController = TextEditingController();
  var valorPorPessoa = "Informe seus dados";
  var formKey = GlobalKey<FormState>();

  void calcular() {
    double quantidadePessoa = double.parse(quantidadePessoaController.text);
    double valorDaConta = double.parse(valorContaController.text);
    double resultado = valorDaConta / quantidadePessoa;
    setState(() {
      valorPorPessoa = "O valor por pessoa é $resultado";
    });
  }

  void clear() {
    setState(() {
      valorPorPessoa = "Informe seus dados";
      quantidadePessoaController.text = '';
      valorContaController.text = '';
    });
  }

  String? validator(String? value) {
    if (value?.isEmpty ?? false) {
      return "O campo é obrigatório";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Raxa conta")),
        actions: [
          IconButton(
              onPressed: () {
                clear();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 20),
                  child: Icon(
                    Icons.monetization_on,
                    size: 120,
                    color: Colors.blue,
                  ),
                ),
                TextFormField(
                  controller: quantidadePessoaController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return validator(value);
                  },
                  decoration: const InputDecoration(
                    labelText: "Quantidade de pessoa",
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
                TextFormField(
                  controller: valorContaController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return validator(value);
                  },
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton(
                      onPressed: () {
                        var isValid = formKey.currentState?.validate() ?? false;
                        if (isValid) {
                          calcular();
                        }
                      },
                      child: const Text(
                        "Calcular",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    ),
                  ),
                ),
                Text(
                  valorPorPessoa,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

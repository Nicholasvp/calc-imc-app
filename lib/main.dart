import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoIMC = '';

  void _calcIMC() {
    setState(() {
      // resultadoIMC = peso * (altura * altura);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Insira os dados',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerPeso,
                decoration: const InputDecoration(
                  labelText: 'Peso(kg)',
                  hintText: 'Digite seu peso em kilogramas',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerAltura,
                decoration: const InputDecoration(
                  labelText: 'Altura(m)',
                  hintText: 'Digite sua altura em metros',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Seu IMC é $resultadoIMC',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      num numAux = (num.parse(controllerPeso.text) /
                          (num.parse(controllerAltura.text) *
                              num.parse(controllerAltura.text)));

                      resultadoIMC = numAux.toStringAsFixed(2);
                    });
                  },
                  child: const Text('Calcular'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

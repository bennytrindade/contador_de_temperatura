import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade900),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade900,
          title: Text(
            "Conversor de temperatura",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(child: Conversor()),
      ),
    );
  }
}

class Conversor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Conversor();
}

class _Conversor extends State<Conversor> {
  var celsiusController = TextEditingController();
  var fahrenheitController = TextEditingController();

  double celsiusparaFahrenheit(double celsius) {
    return celsius * 9 / 5 + 32;
  }

  double fahrenheitparaCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            controller: celsiusController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Graus Celsius",
            ),
          ),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                double celsius = double.tryParse(celsiusController.text) ?? 0.0;
                double fahrenheitConvertido = celsiusparaFahrenheit(celsius);
                fahrenheitController.text = fahrenheitConvertido
                    .toStringAsFixed(1);
              },
              icon: Icon(Icons.arrow_downward),
            ),
            SizedBox(width: 50),
            IconButton(
              onPressed: () {
                double fahrenheit =
                    double.tryParse(fahrenheitController.text) ?? 0.0;
                double celsiusConvertido = fahrenheitparaCelsius(fahrenheit);
                celsiusController.text = celsiusConvertido.toStringAsFixed(2);
              },
              icon: Icon(Icons.arrow_upward),
            ),
          ],
        ),
        SizedBox(height: 50),
        SizedBox(
          width: 200,
          child: TextField(
            controller: fahrenheitController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Graus Fahrenheit",
            ),
          ),
        ),
      ],
    );
  }
}

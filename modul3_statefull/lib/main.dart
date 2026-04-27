import 'package:flutter/material.dart';
import 'input_suhu.dart';
import 'hasil_konversi.dart';
import 'tombol_konversi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // variable
  double _kelvin = 0;
  double _reamur = 0;

  // controller untuk mengambil nilai input
  final TextEditingController _controller = TextEditingController();

  void _konversi() {
    setState(() {
      double input = double.parse(_controller.text);
      _kelvin = input + 273.15;
      _reamur = input * 4 / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konverter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Konverter Suhu")),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(controller: _controller),

              Expanded(
                child: Result(kelvin: _kelvin, reamur: _reamur),
              ),
              Convert(onPressed: _konversi),
            ],
          ),
        ),
      ),
    );
  }
}

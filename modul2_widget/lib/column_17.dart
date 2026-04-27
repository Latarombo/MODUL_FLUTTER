import 'package:flutter/material.dart';

class Tugas17 extends StatelessWidget {
  const Tugas17({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Column Widget")),
        body: Column(
          children: [
            Container(
              color: Colors.purpleAccent,
              child: FlutterLogo(size: 90.0),
            ),
            Container(
              color: Colors.greenAccent,
              child: FlutterLogo(size: 90.0),
            ),
            Container(
              color: Colors.orangeAccent,
              child: FlutterLogo(size: 90.0),
            ),
          ],
        ),
      ),
    );
  }
}

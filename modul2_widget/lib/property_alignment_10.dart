import 'package:flutter/material.dart';

class Tugas10 extends StatelessWidget {
  const Tugas10({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Alignment")),
        body: Container(
          alignment: AlignmentDirectional.bottomCenter,
          child: Text('Semangat Belajar', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Belajar Basic Layout",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Aplikasi Layout sederhana"),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Color.fromARGB(255, 37, 249, 0),
            ),
            Container(
              width: 100,
              height: 100,
              color: Color.fromARGB(255, 249, 0, 0),
            ),
            Container(
              child: Text("Ini adalah Text"),
              color: Colors.deepOrange,
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}

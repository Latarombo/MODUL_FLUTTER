import 'package:flutter/material.dart';

class Tugas19 extends StatelessWidget {
  const Tugas19({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Contoh Stack Widget")),
        body: Stack(
          children: [
            Container(
              color: Colors.green,
              alignment: Alignment.bottomCenter,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Satu",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 40,
              bottom: 60,
              child: Container(
                color: Colors.red,
                alignment: Alignment.bottomCenter,
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Dua",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 250,
                width: 250,
                color: Colors.deepPurple,
                alignment: Alignment.bottomCenter,
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Tiga",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

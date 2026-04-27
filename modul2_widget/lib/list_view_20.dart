import 'package:flutter/material.dart';

class Tugas20 extends StatelessWidget {
  const Tugas20({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Contoh ListView Widget")),
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.green,
              alignment: Alignment.topLeft,
              child: Text(
                "ListView widget digunakan untuk menampilkan data dalam bentuk list dan jika datanya melebihi dari render box maka halaman tersebut dapat di scroll",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              height: 400.0,
              width: 300.0,
              color: Colors.red,
              alignment: Alignment.topLeft,
              child: const Center(
                child: Text(
                  "ListView widget digunakan untuk menampilkan data dalam bentuk list dan jika datanya melebihi dari render box maka halaman tersebut dapat di scroll",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 200.0,
              width: 200.0,
              color: Colors.deepPurple,
              alignment: Alignment.topLeft,
              child: const Center(
                child: Text(
                  "ListView widget digunakan untuk menampilkan data dalam bentuk list dan jika datanya melebihi dari render box maka halaman tersebut dapat di scroll",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

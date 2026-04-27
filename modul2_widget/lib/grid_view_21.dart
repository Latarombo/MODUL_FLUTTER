import 'package:flutter/material.dart';

class Tugas21 extends StatelessWidget {
  const Tugas21({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Contoh GridView Widget")),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: Text(
                "1",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              height: 400.0,
              width: 300.0,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                "2",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              height: 200.0,
              width: 200.0,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: Text(
                "3",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              height: 200.0,
              width: 200.0,
              color: Colors.blueGrey,
              alignment: Alignment.center,
              child: Text(
                "4",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              height: 200.0,
              width: 200.0,
              color: Colors.cyan[800],
              alignment: Alignment.center,
              child: Text(
                "5",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              height: 200.0,
              width: 200.0,
              color: Colors.yellow[800],
              alignment: Alignment.center,
              child: Text(
                "6",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

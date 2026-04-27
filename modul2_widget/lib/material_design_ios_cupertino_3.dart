import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(Tugas3());
}

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            AppBar(title: Text('Contoh Cupertino')),
            CupertinoButton(child: Text("Contoh Button"), onPressed: () {}),
            CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}

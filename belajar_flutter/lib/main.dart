import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Belajar Layouting",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Appbar aplikasi"),
          backgroundColor: Colors.deepOrange,
        ),
        body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i <= 5; i++)
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text("text 1"),
                      width: 80,
                      decoration: BoxDecoration(color: Colors.blue),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(color: Colors.blue, child: Text("data")),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.yellow,
                        child: Text("data"),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(width: 100, height: 100, color: Colors.red),
                    Container(width: 100, height: 100, color: Colors.green),
                    Container(
                      child: Text("ini adalah text"),
                      color: Colors.amber,
                      width: 50,
                      height: 100,
                    ),
                  ],
                ),
                Text("HALO SEMUANYA"),
                Container(width: 100, height: 100, color: Colors.red),
                Container(width: 100, height: 1000, color: Colors.green),
                Text("text paling akhir"),
              ],
            ),
            Column(children: [Text("halo kolum terakhir")]),
          ],
        ),
      ),
    );
  }
}

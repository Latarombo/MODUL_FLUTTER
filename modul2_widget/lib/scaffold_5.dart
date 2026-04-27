import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}
.
class _Tugas5State extends State<Tugas5> {
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sample Code')),
        body: Center(
          child: Text(
            'You have pressed the button $_count times.',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          child: SizedBox(height: 50.0),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
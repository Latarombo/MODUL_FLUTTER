import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final VoidCallback onPressed;
  const Convert({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Text("Konversi Suhu", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

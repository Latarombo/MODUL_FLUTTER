import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required double kelvin,
    required double reamur,
  }) : _kelvin = kelvin, _reamur = reamur;

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Suhu dalam Kelvin",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 8),
            Text(
              _kelvin.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Suhu dalam Reamur",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 8),
            Text(
              _reamur.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

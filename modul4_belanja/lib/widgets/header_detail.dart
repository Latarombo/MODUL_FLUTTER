import 'package:flutter/material.dart';
import '../models/item.dart';

class HeaderDetail extends StatelessWidget {
  const HeaderDetail({super.key, required this.itemArgs});

  final Item itemArgs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const Icon(Icons.shopping_bag, size: 60, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            itemArgs.name,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

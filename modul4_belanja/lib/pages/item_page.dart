import 'package:flutter/material.dart';
import 'package:modul4_navigasi_dan_rute/models/item.dart';
import '../widgets/header_detail.dart';
import '../widgets/card_detail.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // HEADER
          HeaderDetail(itemArgs: itemArgs),

          const SizedBox(height: 10),

          // CARD
          card_detail(itemArgs: itemArgs),
        ],
      ),
    );
  }
}

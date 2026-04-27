import 'package:flutter/material.dart';
import 'package:modul4_navigasi_dan_rute/widgets/item_card.dart';
import 'package:modul4_navigasi_dan_rute/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, description: 'Gula manis berkualitas'),
    Item(name: 'Salt', price: 2000, description: 'Garam dapur halus'),
    Item(name: 'Coffee Beans', price: 8000, description: 'Biji kopi pilihan'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Belanja'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ItemCard(item: item); // Card
          },
        ), // ListView.builder
      ), // Container
    );
  }
}

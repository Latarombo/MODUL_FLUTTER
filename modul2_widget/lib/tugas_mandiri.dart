import 'package:flutter/material.dart';

void main() {
  runApp(const TugasMandiri());
}

class TugasMandiri extends StatelessWidget {
  const TugasMandiri({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF44336),
        elevation: 0,
        title: const Text('MyApp', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            TopMenu(),
            FeaturedNews(),
            NewsItem(),
            NewsItem(),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class TopMenu extends StatelessWidget {
  const TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            'BERITA TERBARU',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Text(
            'PERTANDINGAN HARI INI',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF906D8B)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: Image.network(
              'https://assets.goal.com/images/v3/bltaf202af57bbf43e2/8e9f68dc9178d045468e572aefae38ffe9bf117a.jpg?auto=webp&format=pjpg&width=3840&quality=60',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Center(
              child: Text(
                'Costa Mendekat Ke Palmeiras',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(color: Color(0xFFE03FFD)),
            child: const Text(
              'Transfer',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF7A8F89)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF7A8F89), width: 1),
              ),
            ),
            child: Row(
              children: [
                Image.network(
                  'https://assets.goal.com/images/v3/blt322e79e4a586d832/90fc0bac0091994ffd8736162d591e806c6658a.jpg?auto=webp&format=pjpg&width=3840&quality=60',
                  width: 120,
                  height: 90,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Pique Bilang Wasit Untungkan Madrid, Koeman Tepok Jidat',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Barcelona  Feb 13, 2021',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

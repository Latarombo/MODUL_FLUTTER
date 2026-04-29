import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/leaderboard_controller.dart';
import '../../../routes/app_pages.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {'rank': 1, 'username': 'keisya_pfp', 'score': 12500},
      {'rank': 2, 'username': 'adalahpokoknya', 'score': 8450},
      {'rank': 3, 'username': 'Najwa_Miniww', 'score': 6370},
      {'rank': 4, 'username': 'player_four', 'score': 4220},
      {'rank': 5, 'username': 'player_five', 'score': 3400},
      {'rank': 6, 'username': 'player_six', 'score': 2500},
      {'rank': 7, 'username': 'player_seven', 'score': 1580},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F4E4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B3A3A),
        title: const Text(
          'PERINGKAT GLOBAL',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.offAllNamed(Routes.HOME),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final entry = data[index];
                Color? cardColor;
                if (entry['rank'] == 1)
                  cardColor = const Color(0xFFFFE082);
                else if (entry['rank'] == 2)
                  cardColor = const Color(0xFFE0E0E0);
                else if (entry['rank'] == 3)
                  cardColor = const Color(0xFFBCAAA4);
                else
                  cardColor = Colors.white;

                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 28,
                        child: Text(
                          '${entry['rank']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF270F0F),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const CircleAvatar(radius: 20, child: Icon(Icons.person)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          entry['username'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF270F0F),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${entry['score']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF270F0F),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Card user saat ini
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF8B3A3A), Color(0xFFB85C52)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Text(
                  '3',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff7d9bc),
                  ),
                ),
                SizedBox(width: 16),
                CircleAvatar(radius: 20, child: Icon(Icons.person)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Anda',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfff7d9bc),
                    ),
                  ),
                ),
                Text(
                  '6370',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff7d9bc),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) Get.offAllNamed(Routes.HOME);
          if (index == 2) Get.offAllNamed(Routes.PROFILE);
        },
        backgroundColor: const Color(0xFFFFDDB3),
        selectedItemColor: const Color(0xFF8B5A3C),
        unselectedItemColor: const Color(0xFF8B5A3C).withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

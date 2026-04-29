import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../../routes/app_pages.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F4E4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan background
            Container(
              height: 200,
              width: double.infinity,
              color: const Color(0xFFB85C52),
            ),

            // Card overlap dengan avatar
            Transform.translate(
              offset: const Offset(0, -60),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 80,
                      bottom: 0,
                      left: 24,
                      right: 24,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF9F4E4),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Jhon Doe',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Stats
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: const Color(0xfff8843f).withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatItem(Icons.star, 'POIN', '6370'),
                              Container(
                                width: 1,
                                height: 50,
                                color: Colors.grey[300],
                              ),
                              _buildStatItem(Icons.public, 'PERINGKAT', '3'),
                              Container(
                                width: 1,
                                height: 50,
                                color: Colors.grey[300],
                              ),
                              _buildStatItem(
                                Icons.trending_up,
                                'PRESENTASE',
                                '87%',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Pengaturan akun',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        _buildMenuBtn(
                          'Ganti Nama',
                          () => Get.snackbar('Info', 'Fitur Ganti Nama'),
                        ),
                        const SizedBox(height: 12),
                        _buildMenuBtn(
                          'Ganti Sandi',
                          () => Get.snackbar('Info', 'Fitur Ganti Sandi'),
                        ),
                        const SizedBox(height: 12),
                        _buildMenuBtn(
                          'Ajak Teman',
                          () => Get.snackbar('Info', 'Fitur Ajak Teman'),
                        ),
                        const SizedBox(height: 12),
                        _buildMenuBtn('Log Out', () {
                          Get.dialog(
                            AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: const Text('Konfirmasi'),
                              content: const Text(
                                'Apakah Anda yakin ingin keluar?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text('Batal'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                    Get.offAllNamed(Routes.SIGN_IN);
                                  },
                                  child: const Text(
                                    'Keluar',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),

                  // Avatar
                  const Positioned(
                    top: -60,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Color(0xFFFFDDB3),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) Get.offAllNamed(Routes.HOME);
          if (index == 1) Get.offAllNamed(Routes.LEADERBOARD);
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

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 28, color: Colors.black87),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[700],
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuBtn(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xfff8843f).withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const Icon(Icons.play_arrow, color: Colors.black87, size: 28),
          ],
        ),
      ),
    );
  }
}

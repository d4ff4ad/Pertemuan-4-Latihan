import 'package:flutter/material.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFE2E8F0), height: 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Header Profil
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFE2E8F0), width: 4),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0D000000), // setara Colors.black dengan alpha ~5%
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xFFF1F5F9),
                      backgroundImage: AssetImage('assets/images/Profile.png'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Muhammad Daffa Adzdzikra D',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Mahasiswa Teknik Informatika',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Bagian Menu List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildMenuCard(
                    title: 'Pengaturan Akun',
                    icon: Icons.person_outline,
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildMenuCard(
                    title: 'Riwayat Pesanan',
                    icon: Icons.shopping_bag_outlined,
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildMenuCard(
                    title: 'Privasi & Keamanan',
                    icon: Icons.lock_outline,
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildMenuCard(
                    title: 'Bantuan & Dukungan',
                    icon: Icons.help_outline,
                    onTap: () {},
                  ),
                  const SizedBox(height: 24),
                  _buildMenuCard(
                    title: 'Keluar',
                    icon: Icons.logout,
                    textColor: const Color(0xFFE11D48), // Rose 600
                    iconColor: const Color(0xFFE11D48),
                    onTap: () {},
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000), // setara Colors.black dengan alpha ~2%
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: iconColor ?? const Color(0xFF475569),
                  size: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor ?? const Color(0xFF1E293B),
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF94A3B8),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildGopaySection(),
              _buildMainMenu(),
              _buildPromoSection(),
              _buildVoucherList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                children: const [
                  SizedBox(width: 12),
                  Icon(Icons.search, color: Color(0xFF94A3B8), size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Cari layanan, makanan, & tujuan',
                    style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFF1F5F9),
              backgroundImage: AssetImage('assets/images/Profile.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGopaySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0081A0), // Gopay Blue
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'dafpay',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Rp 125.000',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Klik & cek riwayat',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                _buildGopayAction(Icons.arrow_upward, 'Bayar'),
                const SizedBox(width: 16),
                _buildGopayAction(Icons.add, 'Top Up'),
                const SizedBox(width: 16),
                _buildGopayAction(Icons.explore, 'Eksplor'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGopayAction(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF0081A0), size: 20),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildMainMenu() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMenuItem(Icons.motorcycle, 'DafRide', const Color(0xFF00AA5B)),
              _buildMenuItem(Icons.directions_car, 'DafCar', const Color(0xFF00AA5B)),
              _buildMenuItem(Icons.restaurant, 'DafFood', const Color(0xFFEE2737)),
              _buildMenuItem(Icons.local_shipping, 'DafSend', const Color(0xFF00AA5B)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMenuItem(Icons.shopping_cart, 'DafMart', const Color(0xFFEE2737)),
              _buildMenuItem(Icons.phone_android, 'DafPulsa', const Color(0xFF0081A0)),
              _buildMenuItem(Icons.star, 'DafClub', const Color(0xFF6A35FF)),
              _buildMenuItem(Icons.more_horiz, 'Lainnya', const Color(0xFF94A3B8)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF1E293B)),
        ),
      ],
    );
  }

  Widget _buildPromoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Akses cepat buat kamu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildPromoCard(
                  title: 'Diskon s.d. 50%',
                  subtitle: 'Khusus pengguna baru DafFood & DafRide',
                  buttonText: 'Pesan Sekarang',
                  colors: const [Color(0xFF00AA5B), Color(0xFF0081A0)],
                  icon: Icons.local_offer,
                ),
                const SizedBox(width: 16),
                _buildPromoCard(
                  title: 'Cashback 50 Rb',
                  subtitle: 'Top up DafPay min. 100rb minggu ini',
                  buttonText: 'Top Up DafPay',
                  colors: const [Color(0xFF0081A0), Color(0xFF6A35FF)],
                  icon: Icons.account_balance_wallet,
                ),
                const SizedBox(width: 16),
                _buildPromoCard(
                  title: 'Gratis Ongkir!',
                  subtitle: 'Kirim paket pakai DafSend Instan',
                  buttonText: 'Kirim Paket',
                  colors: const [Color(0xFFEE2737), Color(0xFFF59E0B)],
                  icon: Icons.local_shipping,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard({
    required String title,
    required String subtitle,
    required String buttonText,
    required List<Color> colors,
    required IconData icon,
  }) {
    return Container(
      height: 140,
      width: 280, // Fixed width for horizontal scroll
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              icon,
              size: 100,
              color: Colors.white.withOpacity(0.15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(color: colors.last, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoucherList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kode Voucher Spesial Dafjek',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 12),
          _buildVoucherCard(
            title: 'PENGGUNA BARU',
            subtitle: 'Diskon DafFood 50% hingga Rp30.000',
            buttonText: 'Pakai',
            colors: const [Color(0xFFEE2737), Color(0xFFF59E0B)],
            icon: Icons.fastfood,
          ),
          const SizedBox(height: 16),
          _buildVoucherCard(
            title: 'DAFRIDEYUK',
            subtitle: 'Potongan Rp10.000 untuk perjalanan DafRide',
            buttonText: 'Pakai',
            colors: const [Color(0xFF00AA5B), Color(0xFF0081A0)],
            icon: Icons.motorcycle,
          ),
          const SizedBox(height: 16),
          _buildVoucherCard(
            title: 'PAYDAYDAF',
            subtitle: 'Cashback DafPay 20% khusus gajian',
            buttonText: 'Pakai',
            colors: const [Color(0xFF6A35FF), Color(0xFF9D72FF)],
            icon: Icons.account_balance_wallet,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildVoucherCard({
    required String title,
    required String subtitle,
    required String buttonText,
    required List<Color> colors,
    required IconData icon,
  }) {
    return Container(
      height: 140, // Same size height as horizontal cards
      width: double.infinity, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              icon,
              size: 100,
              color: Colors.white.withOpacity(0.15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.local_activity, size: 14, color: colors.last),
                      const SizedBox(width: 6),
                      Text(
                        buttonText,
                        style: TextStyle(color: colors.last, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'katalog_produk.dart';
import 'notification_page.dart';
import 'profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    KatalogProduk(),
    NotificationPage(),
    HalamanProfil(),
  ];

  final List<String> _pageTitles = const [
    'Beranda',
    'Katalog',
    'Notifikasi',
    'Profil',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDrawerItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    // We only show standard AppBar for pages that aren't the Home Page (index 0)
    // because HomePage (Gojek style) usually has its own custom header.
    // Actually, to make it clean, let's just use a standard Scaffold without AppBar here,
    // and let each page handle its own AppBar, but for Drawer, we need an AppBar or a builder.
    // For HomePage we can have a custom nested AppBar. For now let's just provide a global AppBar
    // except for HomePage.
    
    return Scaffold(
      appBar: _selectedIndex != 0
          ? AppBar(
              title: Text(
                _pageTitles[_selectedIndex],
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF0F172A),
              elevation: 0,
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(color: const Color(0xFFE2E8F0), height: 1),
              ),
            )
          : null, // HomePage handles its own header
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF00AA5B), // Gojek Green
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/Profile.png'),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Muhammad Daffa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Mahasiswa IT',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.home_outlined, 'Beranda', 0),
            _buildDrawerItem(Icons.shopping_bag_outlined, 'Katalog Produk', 1),
            _buildDrawerItem(Icons.notifications_outlined, 'Notifikasi', 2),
            _buildDrawerItem(Icons.person_outline, 'Profil', 3),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings_outlined, color: Color(0xFF64748B)),
              title: const Text('Pengaturan', style: TextStyle(color: Color(0xFF1E293B))),
              onTap: () {
                // Future implementation
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFFE11D48)),
              title: const Text('Keluar', style: TextStyle(color: Color(0xFFE11D48))),
              onTap: () {
                // Future implementation
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _selectedIndex,
                    selectedItemColor: const Color(0xFF00AA5B),
                    unselectedItemColor: const Color(0xFF94A3B8),
                    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    onTap: _onItemTapped,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined),
                        activeIcon: Icon(Icons.home),
                        label: 'Beranda',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_bag_outlined),
                        activeIcon: Icon(Icons.shopping_bag),
                        label: 'Katalog',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.notifications_outlined),
                        activeIcon: Icon(Icons.notifications),
                        label: 'Notifikasi',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline),
                        activeIcon: Icon(Icons.person),
                        label: 'Profil',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    final isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? const Color(0xFF00AA5B) : const Color(0xFF64748B),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xFF00AA5B) : const Color(0xFF1E293B),
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
      selected: isSelected,
      selectedTileColor: const Color(0xFF00AA5B).withOpacity(0.1),
      onTap: () => _onDrawerItemTapped(index),
    );
  }
}

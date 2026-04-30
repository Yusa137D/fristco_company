import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/company_profile_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Bagian Header Sidebar
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF0F172A), // Warna gelap senada dengan header
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.storefront, color: Colors.white, size: 48),
                SizedBox(height: 12),
                Text(
                  'Fristco',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Menu Home
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Menutup drawer terlebih dahulu
              Navigator.pop(context);
              // Pindah ke HomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          // Menu Company Profile
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Company Profile'),
            onTap: () {
              Navigator.pop(context);
              // Pindah ke Company Profile
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CompanyProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
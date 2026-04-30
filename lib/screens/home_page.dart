import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/products_section.dart';
import '../widgets/ratings_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/app_drawer.dart'; // Import Drawer yang baru dibuat

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menambahkan AppBar agar garis 3 muncul
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A), // Warna disamakan dengan header
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Membuat ikon garis 3 jadi putih
      ),
      drawer: const AppDrawer(), // Memanggil Sidebar
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderSection(),
            ProductsSection(),
            RatingsSection(),
            ContactSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
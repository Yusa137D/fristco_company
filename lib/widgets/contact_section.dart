import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // Fungsi untuk membuka URL eksternal
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Tidak dapat membuka link: $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1E293B),
            Color(0xFF0F172A),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          // ---- BAGIAN LOGO SOSIAL MEDIA ----
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tombol Instagram
              InkWell(
                onTap: () {
                  // GANTI LINK DI BAWAH DENGAN LINK INSTAGRAM KAMU
                  _launchURL('https://www.instagram.com/fristco.company?igsh=MXZzcmNpbGljaWQ5ZA%3D%3D&utm_source=qr'); 
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Image.asset(
                    'assets/images/ig.jpeg', // Pastikan gambar ini ada di folder assets
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.camera_alt, color: Colors.white),
                  ),
                ),
              ),
              
              const SizedBox(width: 24), // Jarak antara logo IG dan Shopee
              
              // Tombol Shopee
              InkWell(
                onTap: () {
                  // GANTI LINK DI BAWAH DENGAN LINK SHOPEE KAMU
                  _launchURL('https://id.shp.ee/ZjcYaL5X'); 
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Image.asset(
                    'assets/images/shopee.jpeg', // Pastikan gambar ini ada di folder assets
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 32), // Jarak dari logo ke tulisan "Contact Us"
          // ---- AKHIR BAGIAN LOGO ----

          const Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ContactItem(
                      icon: Icons.phone,
                      title: 'Phone',
                      details: ['+62 812-3456-7890', '+62 821-9876-5432'],
                      color: Color(0xFF3B82F6),
                    ),
                    SizedBox(width: 48),
                    ContactItem(
                      icon: Icons.mail,
                      title: 'Email',
                      details: ['info@fristco.com', 'support@fristco.com'],
                      color: Color(0xFF10B981),
                    ),
                    SizedBox(width: 48),
                    ContactItem(
                      icon: Icons.location_on,
                      title: 'Address',
                      details: ['Jl. Gatot Subroto No. 123', 'Jakarta Selatan, 12950'],
                      color: Color(0xFF8B5CF6),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: const [
                    ContactItem(
                      icon: Icons.phone,
                      title: 'Phone',
                      details: ['+62 812-3456-7890', '+62 821-9876-5432'],
                      color: Color(0xFF3B82F6),
                    ),
                    SizedBox(height: 32),
                    ContactItem(
                      icon: Icons.mail,
                      title: 'Email',
                      details: ['info@fristco.com', 'support@fristco.com'],
                      color: Color(0xFF10B981),
                    ),
                    SizedBox(height: 32),
                    ContactItem(
                      icon: Icons.location_on,
                      title: 'Address',
                      details: ['Jl. Gatot Subroto No. 123', 'Jakarta Selatan, 12950'],
                      color: Color(0xFF8B5CF6),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> details;
  final Color color;

  const ContactItem({
    super.key,
    required this.icon,
    required this.title,
    required this.details,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            ...details.map((detail) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                detail,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFCBD5E1),
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
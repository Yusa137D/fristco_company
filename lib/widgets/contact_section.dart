import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Efek naik ke atas saat di-scroll (menarik container ini 40 pixel ke atas menimpa widget sebelumnya)
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      decoration: BoxDecoration(
        // Membuat batas atas agak melengkung/cekung
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        // Efek blur/bayangan di batas atas
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30, // Semakin besar semakin blur
            spreadRadius: 2,
            offset: const Offset(0, -10), // Bayangan mengarah ke atas
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1E293B),
            Color(0xFF0F172A),
          ],
        ),
      ),
      // Padding atas diperbesar sedikit untuk mengimbangi lengkungan
      padding: const EdgeInsets.only(top: 100, bottom: 80, left: 24, right: 24),
      child: Column(
        children: [
          // ---- BAGIAN LOGO SOSIAL MEDIA YANG SUDAH DIBUAT POP-UP ----
          const SocialMediaPopUp(),
          
          const SizedBox(height: 32),

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
                return const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContactItem(
                      icon: Icons.phone,
                      title: 'Phone',
                      details: ['+62 85732638277'],
                      color: Color(0xFF3B82F6),
                    ),
                    SizedBox(width: 48),
                    ContactItem(
                      icon: Icons.mail,
                      title: 'Email',
                      details: ['fristcocompany@gmail.com'],
                      color: Color(0xFF10B981),
                    ),
                    SizedBox(width: 48),
                    ContactItem(
                      icon: Icons.location_on,
                      title: 'Address',
                      details: ['Jl. Garuda No. 09', 'Kota Madiun, 63153'],
                      color: Color(0xFF8B5CF6),
                    ),
                  ],
                );
              } else {
                return const Column(
                  children: [
                    ContactItem(
                      icon: Icons.phone,
                      title: 'Phone',
                      details: ['+62 85732638277'],
                      color: Color(0xFF3B82F6),
                    ),
                    SizedBox(height: 32),
                    ContactItem(
                      icon: Icons.mail,
                      title: 'Email',
                      details: ['fristcocompany@gmail.com'],
                      color: Color(0xFF10B981),
                    ),
                    SizedBox(height: 32),
                    ContactItem(
                      icon: Icons.location_on,
                      title: 'Address',
                      details: ['Jl. Garuda No. 09', 'Kota Madiun, 63153'],
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

// --- WIDGET BARU: SocialMediaPopUp ---
class SocialMediaPopUp extends StatefulWidget {
  const SocialMediaPopUp({super.key});

  @override
  State<SocialMediaPopUp> createState() => _SocialMediaPopUpState();
}

class _SocialMediaPopUpState extends State<SocialMediaPopUp> {
  bool _isHovered = false;

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Tidak dapat membuka link: $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -10.0 : 0.0),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white.withOpacity(0.03) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ]
              : [],
        ),
        child: Column(
          children: [
            const Text(
              'Tap to shopping',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF94A3B8),
                fontStyle: FontStyle.italic,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
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
                      'assets/images/ig.jpeg',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                InkWell(
                  onTap: () {
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
                      'assets/images/shopee.jpeg',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.shopping_cart, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET BAWAAN ASLI: ContactItem ---
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
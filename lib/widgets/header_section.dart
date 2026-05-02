import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // 1. EFEK BATAS: Membuat sudut bawah melengkung
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        // 2. EFEK BLUR: Memberikan bayangan agar tidak kaku saat bertemu seksi produk
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 2,
            offset: const Offset(0, 15), // Bayangan jatuh ke bawah
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
      // Padding bawah dilebihkan sedikit (100) karena adanya lengkungan
      padding: const EdgeInsets.only(top: 60, bottom: 100, left: 24, right: 24),
      child: Column(
        children: [
          // Logo & Nama Kecil di Pojok Kanan Atas
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [ 
                
                // --- PERUBAHAN: Logo Kecil Dibuat Bundar ---
                ClipOval(
                  child: Image.asset(
                    'assets/images/logo_teks.jpeg', 
                    height: 45, // Tinggi gambar
                    width: 45,  // Lebar wajib sama dengan tinggi agar bulat sempurna
                    fit: BoxFit.cover, // Memotong gambar agar pas memenuhi area lingkaran
                  ),
                ),
                
                const SizedBox(width: 12), // Jarak antara logo dan teks
                
                // --- PERUBAHAN: Font diperbesar ---
                const Text(
                  'FRISTCO COMPANY',
                  style: TextStyle(
                    fontSize: 22, // <-- Dari 16 diubah menjadi 22 agar lebih besar
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Judul Utama (Gambar Logo Besar)
          Image.asset(
            'assets/images/logo_header.jpeg', 
            height: 350, 
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 16),
          const Text(
            'Premium Shirts & Flannel Collection',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFCBD5E1),
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          
          // Banner Image dengan Efek Animasi
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(seconds: 1),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 30 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/banner_brand.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 50),
          
          // Row Feature Boxes
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 900;
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: const [
                  FeatureBox(
                    icon: Icons.workspace_premium,
                    title: 'Premium Quality',
                    subtitle: 'Bahan berkualitas tinggi',
                    color: Color(0xFFFBBF24),
                  ),
                  FeatureBox(
                    icon: Icons.shopping_bag,
                    title: 'Fast Delivery',
                    subtitle: 'Pengiriman cepat',
                    color: Color(0xFF4ADE80),
                  ),
                  FeatureBox(
                    icon: Icons.people,
                    title: 'Trusted Brand',
                    subtitle: '10.000+ pelanggan',
                    color: Color(0xFF60A5FA),
                  ),
                  FeatureBox(
                    icon: Icons.attach_money,
                    title: 'Harga Terjangkau',
                    subtitle: 'Kualitas premium bersahabat',
                    color: Color(0xFFA78BFA),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class FeatureBox extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const FeatureBox({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  State<FeatureBox> createState() => _FeatureBoxState();
}

class _FeatureBoxState extends State<FeatureBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 210,
        padding: const EdgeInsets.all(20),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -10.0 : 0.0),
        decoration: BoxDecoration(
          color: _isHovered ? const Color(0xFF1E293B) : const Color(0xFF1E293B).withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: _isHovered ? widget.color.withOpacity(0.5) : const Color(0xFF334155),
            width: 1.5,
          ),
          boxShadow: _isHovered ? [
            BoxShadow(
              color: widget.color.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ] : [],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(widget.icon, color: widget.color, size: 28),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              widget.subtitle,
              style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
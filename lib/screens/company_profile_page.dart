import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/footer_section.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Definisi Style untuk isi konten agar seragam
    const TextStyle contentStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: Color(0xFF334155),
      height: 1.6,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Company Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0F172A),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              color: Colors.white,
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Header About Us dengan Animasi
                      FadeInSlideUp(
                        delay: 0,
                        child: Column(
                          children: [
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 56,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'About ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Us',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 12, 7, 61),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: 180,
                              height: 10,
                              color: const Color.fromARGB(255, 255, 255, 255), // Garis putih (bisa diubah jika tidak terlihat di background putih)
                            ),
                            const SizedBox(height: 56),
                            // Deskripsi Utama
                            const Text(
                              'Fristco Company didirikan dengan semangat kreativitas dan kecintaan terhadap seni visual, Fristco Company menawarkan pakaian streetwear dengan desain original artwork yang dibuat langsung oleh pendiri, sehingga setiap produk memiliki keunikan dan nilai seni estetika tersendiri.',
                              style: contentStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 80),

                      // SECTION VISI (Dengan Hover Effect)
                      FadeInSlideUp(
                        delay: 200,
                        child: HoverInfoCard(
                          titlePart1: 'Vi',
                          titlePart2: 'si',
                          content: const Text(
                            'Menjadi brand clothing terdepan yang menghadirkan flannel dan jacket berkualitas tinggi dengan desain stylish, nyaman, dan relevan untuk gaya hidup modern.',
                            style: contentStyle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // SECTION MISI (Dengan Hover Effect)
                      FadeInSlideUp(
                        delay: 400,
                        child: HoverInfoCard(
                          titlePart1: 'Mi',
                          titlePart2: 'si',
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildMissionItem('Menghadirkan produk flannel dan jacket dengan bahan premium dan kualitas terbaik.', contentStyle),
                              _buildMissionItem('Mengembangkan desain yang mengikuti tren tanpa menghilangkan identitas brand.', contentStyle),
                              _buildMissionItem('Memberikan kenyamanan dan kepercayaan diri bagi setiap pelanggan.', contentStyle),
                              _buildMissionItem('Menjaga konsistensi kualitas dalam setiap produksi.', contentStyle),
                              _buildMissionItem('Membangun hubungan yang kuat dengan pelanggan melalui pelayanan yang baik dan inovasi berkelanjutan.', contentStyle),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Tim Section (Dengan Hover Effect)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              color: const Color(0xFFF1F5F9),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: FadeInSlideUp(
                    delay: 600,
                    child: Column(
                      children: [
                        const Text(
                          'Meet Our Team',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 64),
                        Wrap(
                          spacing: 40,
                          runSpacing: 48,
                          alignment: WrapAlignment.center,
                          children: const [
                            TeamMemberCard(
                              name: 'Wendy Friska Prastya',
                              role: 'Founder & CEO',
                              imageUrl: 'assets/images/owner.jpeg',
                            ),
                            TeamMemberCard(
                              name: 'Yusa’ Eka Setiawan',
                              role: 'Lead Developer',
                              imageUrl: 'assets/images/developer.jpeg',
                            ),
                            TeamMemberCard(
                              name: 'Desta Berlinda Faathir',
                              role: 'Designer',
                              imageUrl: 'assets/images/contributor3.jpeg',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionItem(String text, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Color(0xFF3B82F6),
            ),
          ),
          Expanded(child: Text(text, style: style)),
        ],
      ),
    );
  }
}

// ==========================================
// KUMPULAN WIDGET CUSTOM & ANIMASI DI BAWAH INI
// ==========================================

// 1. WIDGET ANIMASI MASUK (FADE & SLIDE UP)
class FadeInSlideUp extends StatefulWidget {
  final Widget child;
  final int delay;

  const FadeInSlideUp({super.key, required this.child, this.delay = 0});

  @override
  State<FadeInSlideUp> createState() => _FadeInSlideUpState();
}

class _FadeInSlideUpState extends State<FadeInSlideUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _offset = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _offset,
        child: widget.child,
      ),
    );
  }
}

// 2. KARTU VISI & MISI DENGAN HOVER EFFECT
class HoverInfoCard extends StatefulWidget {
  final String titlePart1;
  final String titlePart2;
  final Widget content;

  const HoverInfoCard({
    super.key,
    required this.titlePart1,
    required this.titlePart2,
    required this.content,
  });

  @override
  State<HoverInfoCard> createState() => _HoverInfoCardState();
}

class _HoverInfoCardState extends State<HoverInfoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0), // Efek terangkat
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered ? const Color(0xFF3B82F6).withOpacity(0.5) : const Color(0xFFE2E8F0),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.08 : 0.02),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 10 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Dua Warna
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: widget.titlePart1,
                        style: const TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: widget.titlePart2,
                        style: const TextStyle(color: Color.fromARGB(255, 12, 7, 61)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _isHovered ? 100 : 60, // Garis memanjang saat dihover
                  height: 6,
                  color: const Color.fromARGB(255, 32, 30, 145),
                ),
              ],
            ),
            const SizedBox(height: 32),
            widget.content,
          ],
        ),
      ),
    );
  }
}

// 3. KARTU ANGGOTA TIM DENGAN HOVER EFFECT ZOOM FOTO
class TeamMemberCard extends StatefulWidget {
  final String name;
  final String role;
  final String imageUrl;

  const TeamMemberCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  @override
  State<TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<TeamMemberCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            width: 200,
            height: 200,
            transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0), // Efek foto membesar
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFCBD5E1),
              border: Border.all(
                color: _isHovered ? const Color(0xFF3B82F6) : Colors.white, // Border biru saat hover
                width: 8,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(_isHovered ? 0.2 : 0.1),
                  blurRadius: _isHovered ? 30 : 20,
                  offset: Offset(0, _isHovered ? 15 : 10),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                widget.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person, size: 100, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 24),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _isHovered ? const Color(0xFF3B82F6) : const Color(0xFF0F172A), // Warna teks berubah
            ),
            child: Text(widget.name),
          ),
          const SizedBox(height: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _isHovered ? const Color(0xFF3B82F6) : const Color(0xFF1E293B), // Background role berubah
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              widget.role,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
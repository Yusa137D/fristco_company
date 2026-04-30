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
      fontWeight: FontWeight.w700, // Tebal agar terlihat "Bold"
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
                      // Header About Us
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
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      const SizedBox(height: 56),

                      // Deskripsi Utama
                      const Text(
                        'Fristco Company didirikan dengan semangat kreativitas dan kecintaan terhadap seni visual, Fristco Company menawarkan pakaian streetwear dengan desain ori final artwork yang dibuat langsung oleh pendiri, sehingga setiap produk memiliki keunikan dan nilai seni estetika tersendiri.',
                        style: contentStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 80),

                      // SECTION VISI
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFE2E8F0),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTwoToneHeader(
                              'Vi',
                              'si',
                            ), // Memanggil widget judul Visi
                            const SizedBox(height: 24),
                            const Text(
                              'Menjadi brand clothing terdepan yang menghadirkan flannel dan jacket berkualitas tinggi dengan desain stylish, nyaman, dan relevan untuk gaya hidup modern.',
                              style: contentStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      // SECTION MISI
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFE2E8F0),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTwoToneHeader(
                              'Mi',
                              'si',
                            ), // Memanggil widget judul Misi
                            const SizedBox(height: 32),
                            _buildMissionItem(
                              'Menghadirkan produk flannel dan jacket dengan bahan premium dan kualitas terbaik.',
                              contentStyle,
                            ),
                            _buildMissionItem(
                              'Mengembangkan desain yang mengikuti tren tanpa menghilangkan identitas brand.',
                              contentStyle,
                            ),
                            _buildMissionItem(
                              'Memberikan kenyamanan dan kepercayaan diri bagi setiap pelanggan.',
                              contentStyle,
                            ),
                            _buildMissionItem(
                              'Menjaga konsistensi kualitas dalam setiap produksi.',
                              contentStyle,
                            ),
                            _buildMissionItem(
                              'Membangun hubungan yang kuat dengan pelanggan melalui pelayanan yang baik dan inovasi berkelanjutan.',
                              contentStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Tim Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              color: const Color(0xFFF1F5F9),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1100),
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
                        children: [
                          _buildTeamMember(
                            name: 'Nama Owner',
                            role: 'Founder & CEO',
                            imageUrl: 'assets/images/owner.jpeg',
                          ),
                          _buildTeamMember(
                            name: 'Yusa’ Eka Setiawan',
                            role: 'Lead Developer',
                            imageUrl: 'assets/images/developer.jpeg',
                          ),
                          _buildTeamMember(
                            name: 'Nama Kontributor 3',
                            role: 'Co-Founder / Designer',
                            imageUrl: 'assets/images/contributor3.jpeg',
                          ),
                        ],
                      ),
                    ],
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

  // Widget baru untuk membuat judul dengan 2 warna & garis merah
  Widget _buildTwoToneHeader(String part1, String part2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize:
                  40, // Sedikit lebih kecil dari 'About Us' agar hierarki visual terjaga
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
            children: [
              TextSpan(
                text: part1,
                style: const TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: part2,
                style: const TextStyle(color: Color.fromARGB(255, 12, 7, 61)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Garis bawah merah yang disesuaikan ukurannya
        Container(
          width: 60,
          height: 6,
          color: const Color.fromARGB(255, 32, 30, 145),
        ),
      ],
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

  Widget _buildTeamMember({
    required String name,
    required String role,
    required String imageUrl,
  }) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFCBD5E1),
            border: Border.all(color: Colors.white, width: 8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person, size: 100, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            role,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

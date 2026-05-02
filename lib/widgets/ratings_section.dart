import 'dart:async';
import 'package:flutter/material.dart';
import '../models/testimonial.dart';

class RatingsSection extends StatefulWidget {
  const RatingsSection({super.key});

  @override
  State<RatingsSection> createState() => _RatingsSectionState();
}

class _RatingsSectionState extends State<RatingsSection> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  final testimonials = [
    Testimonial(
      name: 'Andi Wijaya',
      rating: 5,
      comment: 'Kualitas bahannya sangat bagus, jahitannya rapi. Puas banget!',
    ),
    Testimonial(
      name: 'Budi Santoso',
      rating: 5,
      comment: 'Flannel favorit saya! Nyaman dipakai dan modelnya keren.',
    ),
    Testimonial(
      name: 'Dimas Prakoso',
      rating: 4,
      comment: 'Kemejanya premium, cocok untuk meeting kantor.',
    ),
    Testimonial(
      name: 'Rizky Febrian',
      rating: 5,
      comment: 'Pengiriman super cepat dan adminnya ramah. Mantap Fristco!',
    ),
    Testimonial(
      name: 'Kevin Julian',
      rating: 5,
      comment: 'Ukurannya pas di badan, bahannya adem nggak bikin gerah.',
    ),
    Testimonial(
      name: 'Hendra Gunawan',
      rating: 4,
      comment: 'Beli kedua kalinya di sini, selalu puas sama kualitasnya.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  // --- FUNGSI AUTO SCROLL ---
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;
        
        // Lebar kartu (350) + padding kanan (24) = 374
        const double scrollAmount = 374.0; 

        if (currentScroll >= maxScroll) {
          _scrollController.animateTo(
            0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            currentScroll + scrollAmount,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: FadeInSlideUpTransition(
        child: Column(
          children: [
            const Text(
              'Customer Reviews',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              height: 330, // Tinggi diperbesar sedikit agar quote di atas tidak terpotong
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                // Padding vertikal (atas/bawah) dibuat 32 agar ada ruang untuk icon menonjol
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                itemCount: testimonials.length,
                clipBehavior: Clip.none, // Memastikan bayangan dan icon tidak terpotong tepi list
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: TestimonialCard(testimonial: testimonials[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET KOMPONEN ANIMASI MASUK ---
class FadeInSlideUpTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const FadeInSlideUpTransition({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 100 * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

// --- WIDGET KARTU REVIEW ---
class TestimonialCard extends StatefulWidget {
  final Testimonial testimonial;

  const TestimonialCard({super.key, required this.testimonial});

  @override
  State<TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<TestimonialCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        width: 350,
        padding: const EdgeInsets.all(0), // Di-nol-kan karena pakai Stack & inner Padding
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -12.0 : 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.1 : 0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 10 : 2),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 1. Lingkaran Kuning Tanda Kutip
            Positioned(
              left: 24,
              top: -24, // Dibuat setengah menonjol keluar ke atas
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFFFBBF24), // Kuning Emas
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.format_quote,
                  color: Color(0xFF0F172A),
                  size: 30,
                ),
              ),
            ),

            // 2. Isi Utama Kartu
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 45, 32, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Peringkat Bintang
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: index < widget.testimonial.rating
                            ? const Color(0xFFFBBF24) // Emas
                            : const Color(0xFFE5E7EB), // Abu-abu
                        size: 20,
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  
                  // Komentar
                  Text(
                    widget.testimonial.comment,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF334155),
                      fontWeight: FontWeight.w400,
                      height: 1.5, // Jarak antar baris agar nyaman dibaca
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),

                  // Garis Pemisah
                  const Divider(color: Color(0xFFE2E8F0)),
                  const SizedBox(height: 16),

                  // Footer (Profil & Nama)
                  Row(
                    children: [
                      const Icon(
                        Icons.account_circle,
                        color: Color(0xFF94A3B8),
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.testimonial.name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0F172A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
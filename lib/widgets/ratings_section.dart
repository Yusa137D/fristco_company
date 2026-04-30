import 'package:flutter/material.dart';
import '../models/testimonial.dart';

class RatingsSection extends StatelessWidget {
  const RatingsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
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
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: testimonials.map((t) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TestimonialCard(testimonial: t),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return Column(
                  children: testimonials.map((t) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: TestimonialCard(testimonial: t),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color: index < testimonial.rating
                    ? const Color(0xFFFBBF24)
                    : const Color(0xFFE5E7EB),
                size: 20,
              );
            }),
          ),
          const SizedBox(height: 16),
          Text(
            '"${testimonial.comment}"',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF334155),
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '- ${testimonial.name}',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

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
          const Text(
            'FRISTCO COMPANY',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Premium Shirts & Flannel Collection',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFFCBD5E1),
            ),
          ),
          const SizedBox(height: 32),
          
          // Banner Image
          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/banner_brand.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          const SizedBox(height: 48),
          
          // Feature Boxes
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FeatureBox(
                      icon: Icons.workspace_premium,
                      title: 'Premium Quality',
                      subtitle: 'Bahan berkualitas tinggi',
                      color: Color(0xFFFBBF24),
                    ),
                    SizedBox(width: 24),
                    FeatureBox(
                      icon: Icons.shopping_bag,
                      title: 'Fast Delivery',
                      subtitle: 'Pengiriman cepat',
                      color: Color(0xFF4ADE80),
                    ),
                    SizedBox(width: 24),
                    FeatureBox(
                      icon: Icons.people,
                      title: 'Trusted Brand',
                      subtitle: '10.000+ pelanggan',
                      color: Color(0xFF60A5FA),
                    ),
                    SizedBox(width: 24),
                    FeatureBox(
                      icon: Icons.attach_money,
                      title: 'Harga Terjangkau',
                      subtitle: 'Kualitas premium harga bersahabat',
                      color: Color(0xFFA78BFA),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: const [
                    FeatureBox(
                      icon: Icons.workspace_premium,
                      title: 'Premium Quality',
                      subtitle: 'Bahan berkualitas tinggi',
                      color: Color(0xFFFBBF24),
                    ),
                    SizedBox(height: 24),
                    FeatureBox(
                      icon: Icons.shopping_bag,
                      title: 'Fast Delivery',
                      subtitle: 'Pengiriman cepat',
                      color: Color(0xFF4ADE80),
                    ),
                    SizedBox(height: 24),
                    FeatureBox(
                      icon: Icons.people,
                      title: 'Trusted Brand',
                      subtitle: '10.000+ pelanggan',
                      color: Color(0xFF60A5FA),
                    ),
                    SizedBox(height: 24),
                    FeatureBox(
                      icon: Icons.attach_money,
                      title: 'Harga Terjangkau',
                      subtitle: 'Kualitas premium harga bersahabat',
                      color: Color(0xFFA78BFA),
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

class FeatureBox extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.5),
        border: Border.all(color: const Color(0xFF334155)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF94A3B8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
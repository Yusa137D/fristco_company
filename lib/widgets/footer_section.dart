import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF020617),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: const Center(
        child: Text(
          '© 2026 Fristco Company. All rights reserved.',
          style: TextStyle(
            color: Color(0xFF64748B),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
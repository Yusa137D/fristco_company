import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        name: 'Flannel Veterano Black White',
        price: 'Rp 160.000',
        imageUrl: 'assets/images/product1.jpeg',
      ),
      Product(
        name: 'Flannel Veterano Blue Black',
        price: 'Rp 160.000',
        imageUrl: 'assets/images/product2.jpeg',
      ),
      Product(
        name: 'Longslevee Shirt',
        price: 'Rp 120.000',
        imageUrl: 'assets/images/product3.jpeg',
      ),
      Product(
        name: 'Jacket Work Boxy',
        price: 'Rp 180.000',
        imageUrl: 'assets/images/product4.jpeg',
      ),
      Product(
        name: 'Shirt Boxy',
        price: 'Rp 100.000',
        imageUrl: 'assets/images/product5.jpeg',
      ),
      Product(
        name: 'Crewneck Boxy',
        price: 'Rp 150.000',
        imageUrl: 'assets/images/product6.jpeg',
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Our Products',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 1200) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth > 600) {
                crossAxisCount = 2;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  // Efek Animasi Masuk Beruntun (Staggered Animation)
                  return TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    // Durasi ditambah berdasarkan index agar munculnya bergantian
                    duration: Duration(milliseconds: 500 + (index * 150)), 
                    curve: Curves.easeOutCubic,
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 50 * (1 - value)), // Meluncur dari bawah
                          child: child,
                        ),
                      );
                    },
                    child: ProductCard(product: products[index]),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// Diubah menjadi StatefulWidget untuk mendeteksi kursor (Hover)
class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isHovered = false; // Status apakah kartu sedang ditunjuk kursor

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        // Efek kartu terangkat ke atas saat di-hover
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -12.0 : 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              // Bayangan lebih menyebar dan gelap saat di-hover
              color: Colors.black.withOpacity(_isHovered ? 0.2 : 0.1),
              blurRadius: _isHovered ? 30 : 20,
              offset: Offset(0, _isHovered ? 15 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFD1D5DB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  // Efek Zoom pada gambar saat di-hover
                  child: AnimatedScale(
                    scale: _isHovered ? 1.08 : 1.0, // Membesar 8% saat disentuh
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    // Mengganti Image.network menjadi Image.asset karena pakai aset lokal
                    child: Image.asset(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFFD1D5DB),
                          child: const Icon(Icons.image, size: 64, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            // Price Section
            Expanded(
              flex: 4,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    // Warna gradient sedikit lebih terang saat di-hover
                    colors: _isHovered 
                        ? const [Color(0xFF4B5563), Color(0xFF374151)]
                        : const [Color(0xFF374151), Color(0xFF1F2937)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.product.price,
                      style: TextStyle(
                        fontSize: 32, // Sedikit disesuaikan agar tidak terlalu sesak
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(2, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
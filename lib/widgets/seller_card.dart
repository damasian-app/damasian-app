import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme.dart';

class SellerCard extends StatelessWidget {
  final Seller seller;
  final VoidCallback onTap;

  const SellerCard({
    Key? key,
    required this.seller,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.grey[200],
              child: Image.network(
                seller.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.grey[400],
                    ),
                  );
                },
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Seller Name
                  Text(
                    seller.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatItem(
                        label: 'منتجات',
                        value: seller.productCount.toString(),
                      ),
                      _StatItem(
                        label: 'متابعون',
                        value: seller.followers > 1000
                            ? '${(seller.followers / 1000).toStringAsFixed(1)}k'
                            : seller.followers.toString(),
                      ),
                      _StatItem(
                        label: 'التقييم',
                        value: seller.rating.toString(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Visit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onTap,
                      child: const Text('زيارة المتجر'),
                    ),
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

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: DamasianTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

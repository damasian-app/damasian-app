import 'package:flutter/material.dart';
import '../models/models.dart';
import '../data/mock_data.dart';
import '../theme.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class SellerDetailScreen extends StatelessWidget {
  final Seller seller;
  const SellerDetailScreen({super.key, required this.seller});
  @override
  Widget build(BuildContext context) {
    final products = mockProducts.where((p) => p.sellerId == seller.id).toList();
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(expandedHeight: 200, pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(seller.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            background: Image.network(seller.image, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: Colors.grey[300], child: const Icon(Icons.store, size: 64))),
          )),
        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _Stat(label: 'المنتجات', value: seller.productCount.toString(), icon: Icons.shopping_bag),
            _Stat(label: 'المتابعون', value: seller.followers > 1000 ? '${(seller.followers/1000).toStringAsFixed(1)}k' : seller.followers.toString(), icon: Icons.people),
            _Stat(label: 'التقييم', value: seller.rating.toString(), icon: Icons.star),
          ]),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('متابعة المتجر'))),
          const Divider(height: 32),
          const Text('عن المتجر', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(seller.description, style: const TextStyle(fontSize: 14, height: 1.6, color: DamasianTheme.textSecondary)),
          const Divider(height: 32),
          const Text('منتجات المتجر', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
        ]))),
        SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.7),
            delegate: SliverChildBuilderDelegate((c, i) => ProductCard(product: products[i], onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: products[i])))), childCount: products.length),
          )),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ]),
    );
  }
}
class _Stat extends StatelessWidget {
  final String label, value; final IconData icon;
  const _Stat({required this.label, required this.value, required this.icon});
  @override
  Widget build(BuildContext context) => Column(children: [Icon(icon, color: DamasianTheme.primary, size: 24), const SizedBox(height: 4), Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text(label, style: const TextStyle(fontSize: 12, color: DamasianTheme.textSecondary))]);
}

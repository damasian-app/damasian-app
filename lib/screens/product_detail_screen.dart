import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme.dart';
import '../data/cart_manager.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? _selectedColor;
  String? _selectedSize;
  bool _addedToCart = false;

  @override
  void initState() {
    super.initState();
    if (widget.product.colors.isNotEmpty) _selectedColor = widget.product.colors.first;
    if (widget.product.sizes.isNotEmpty) _selectedSize = widget.product.sizes.first;
  }

  void _addToCart() {
    CartManager.instance.addItem(widget.product);
    setState(() => _addedToCart = true);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('تمت الإضافة إلى السلة'),
      backgroundColor: DamasianTheme.success,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(label: 'تراجع', textColor: Colors.white,
        onPressed: () { CartManager.instance.removeItem(widget.product.id); setState(() => _addedToCart = false); }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    return Scaffold(
      appBar: AppBar(title: Text(p.name)),
      body: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 300, width: double.infinity,
          child: Image.network(p.image, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: Colors.grey[200], child: const Icon(Icons.image_not_supported, size: 64)))),
        Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(child: Text(p.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            Row(children: [const Icon(Icons.star, color: Colors.amber, size: 18), const SizedBox(width: 4), Text('${p.rating} (${p.reviewCount})', style: const TextStyle(fontSize: 14, color: DamasianTheme.textSecondary))]),
          ]),
          const SizedBox(height: 8),
          Row(children: [
            Text('${p.price.toStringAsFixed(0)} ر.س', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: DamasianTheme.primary)),
            const SizedBox(width: 12),
            if (p.originalPrice > p.price) Text('${p.originalPrice.toStringAsFixed(0)} ر.س', style: const TextStyle(fontSize: 16, decoration: TextDecoration.lineThrough, color: DamasianTheme.textSecondary)),
            const SizedBox(width: 8),
            if (p.discountPercentage > 0) Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: DamasianTheme.error, borderRadius: BorderRadius.circular(4)), child: Text('-${p.discountPercentage}%', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
          ]),
          const SizedBox(height: 8),
          Text('البائع: ${p.sellerName}', style: const TextStyle(fontSize: 14, color: DamasianTheme.textSecondary)),
          const Divider(height: 32),
          const Text('وصف المنتج', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(p.description, style: const TextStyle(fontSize: 14, height: 1.6, color: DamasianTheme.textSecondary)),
          if (p.colors.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text('اللون', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(spacing: 8, children: p.colors.map((c) { final s = _selectedColor == c; return ChoiceChip(label: Text(c), selected: s, onSelected: (_) => setState(() => _selectedColor = c), selectedColor: DamasianTheme.primary, labelStyle: TextStyle(color: s ? Colors.white : DamasianTheme.textPrimary)); }).toList()),
          ],
          if (p.sizes.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text('المقاس', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(spacing: 8, children: p.sizes.map((s) { final sel = _selectedSize == s; return ChoiceChip(label: Text(s), selected: sel, onSelected: (_) => setState(() => _selectedSize = s), selectedColor: DamasianTheme.primary, labelStyle: TextStyle(color: sel ? Colors.white : DamasianTheme.textPrimary)); }).toList()),
          ],
          const SizedBox(height: 24),
        ])),
      ])),
      bottomNavigationBar: Padding(padding: const EdgeInsets.all(16),
        child: SizedBox(height: 50, child: ElevatedButton.icon(
          onPressed: _addedToCart ? null : _addToCart,
          icon: Icon(_addedToCart ? Icons.check : Icons.shopping_cart),
          label: Text(_addedToCart ? 'تمت الإضافة' : 'أضف إلى السلة'),
        ))),
    );
  }
}

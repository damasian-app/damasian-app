import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/models.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class ProductsScreen extends StatefulWidget {
  final String? initialCategory;
  const ProductsScreen({super.key, this.initialCategory});
  @override State<ProductsScreen> createState() => _ProductsScreenState();
}
class _ProductsScreenState extends State<ProductsScreen> {
  late List<Product> dp; final _sc = TextEditingController(); String _sf = 'all'; String? _cat;
  @override void initState() { super.initState(); _cat = widget.initialCategory; dp = _f(mockProducts); _sc.addListener(() => setState(() { dp = _f(mockProducts); })); }
  List<Product> _f(List<Product> src) {
    var r = src.toList();
    if (_cat != null) r = r.where((p) => p.category == _cat).toList();
    if (_sc.text.isNotEmpty) r = r.where((p) => p.name.toLowerCase().contains(_sc.text.toLowerCase())).toList();
    switch (_sf) {
      case 'price_asc': r.sort((a, b) => a.price.compareTo(b.price)); break;
      case 'price_desc': r.sort((a, b) => b.price.compareTo(a.price)); break;
      case 'rating': r.sort((a, b) => b.rating.compareTo(a.rating)); break;
      case 'discount': r.sort((a, b) => b.discountPercentage.compareTo(a.discountPercentage)); break;
    }
    return r;
  }
  void _set(String f) => setState(() { _sf = f; _cat = null; dp = _f(mockProducts); });
  @override void dispose() { _sc.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المنتجات')),
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(16), child: TextField(controller: _sc, decoration: InputDecoration(hintText: 'ابحث عن منتج...', prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))))),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [
          _chip('الكل', 'all'), const SizedBox(width: 8), _chip('السعر ↑', 'price_asc'), const SizedBox(width: 8), _chip('السعر ↓', 'price_desc'), const SizedBox(width: 8), _chip('الأعلى تقييماً', 'rating'), const SizedBox(width: 8), _chip('الأكثر خصماً', 'discount'),
        ]))),
        const SizedBox(height: 16),
        Expanded(child: dp.isEmpty
          ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.search_off, size: 48, color: Colors.grey[400]), const SizedBox(height: 16), Text('لا توجد منتجات', style: TextStyle(fontSize: 16, color: Colors.grey[600]))]))
          : GridView.builder(padding: const EdgeInsets.symmetric(horizontal: 16), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.7), itemCount: dp.length, itemBuilder: (c, i) => ProductCard(product: dp[i], onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: dp[i])))))),
      ]),
    );
  }
  Widget _chip(String label, String f) => FilterChip(label: Text(label), selected: _sf == f, onSelected: (_) => _set(f));
}

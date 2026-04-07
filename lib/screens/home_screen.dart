import 'dart:async';
import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../data/cart_manager.dart';
import '../theme.dart';
import '../widgets/product_card.dart';
import '../widgets/seller_card.dart';
import '../widgets/category_card.dart';
import 'product_detail_screen.dart';
import 'seller_detail_screen.dart';
import 'products_screen.dart';
import 'sellers_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late PageController _pc; int _bi = 0; Timer? _t; int _cc = 0;
  @override void initState() { super.initState(); _pc = PageController(); _cc = CartManager.instance.totalCount; CartManager.instance.addListener(_oc); _t = Timer.periodic(const Duration(seconds: 5), (_) { if (mounted && _pc.hasClients) _pc.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut); }); }
  void _oc() { if (mounted) setState(() { _cc = CartManager.instance.totalCount; }); }
  @override void dispose() { _t?.cancel(); _pc.dispose(); CartManager.instance.removeListener(_oc); super.dispose(); }
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Damasian'), actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductsScreen()))),
        Stack(children: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
          if (_cc > 0) Positioned(right: 8, top: 8, child: Container(padding: const EdgeInsets.all(2), decoration: BoxDecoration(color: DamasianTheme.error, borderRadius: BorderRadius.circular(10)), constraints: const BoxConstraints(minWidth: 18, minHeight: 18), child: Text('$_cc', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center))),
        ]),
      ]),
      body: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 160, child: PageView.builder(controller: _pc, onPageChanged: (i) => setState(() => _bi = i % mockBanners.length), itemBuilder: (c, i) { final b = mockBanners[i % mockBanners.length]; return Container(margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage(b.image), fit: BoxFit.cover)), child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withAlpha(77)])), alignment: Alignment.bottomLeft, padding: const EdgeInsets.all(16), child: Text(b.title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)))); })),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(mockBanners.length, (i) => Container(width: _bi == i ? 16 : 8, height: 8, margin: const EdgeInsets.symmetric(horizontal: 3), decoration: BoxDecoration(color: _bi == i ? DamasianTheme.primary : Colors.grey[300], borderRadius: BorderRadius.circular(4))))),
        const SizedBox(height: 16),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('الفئات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductsScreen())), child: const Text('عرض الكل'))])),
        SizedBox(height: 100, child: ListView.builder(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 12), itemCount: mockCategories.length, itemBuilder: (c, i) => Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: CategoryCard(category: mockCategories[i], onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductsScreen(initialCategory: mockCategories[i].id))))))),
        const SizedBox(height: 16),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('منتجات مميزة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductsScreen())), child: const Text('عرض الكل'))])),
        SizedBox(height: 260, child: ListView.builder(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 12), itemCount: mockProducts.length, itemBuilder: (c, i) => SizedBox(width: 160, child: Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: ProductCard(product: mockProducts[i], onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: mockProducts[i])))))))),
        const SizedBox(height: 24),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('بائعون مميزون', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SellersScreen())), child: const Text('عرض الكل'))])),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: ListView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: mockSellers.length, itemBuilder: (c, i) => Padding(padding: const EdgeInsets.only(bottom: 12), child: SellerCard(seller: mockSellers[i], onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SellerDetailScreen(seller: mockSellers[i]))))))),
        const SizedBox(height: 24),
      ])),
    );
  }
}

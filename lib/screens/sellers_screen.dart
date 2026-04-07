import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/models.dart';
import '../widgets/seller_card.dart';
import 'seller_detail_screen.dart';

class SellersScreen extends StatefulWidget {
  const SellersScreen({super.key});
  @override State<SellersScreen> createState() => _SellersScreenState();
}
class _SellersScreenState extends State<SellersScreen> {
  late List<Seller> ds; final _sc = TextEditingController(); String _sf = 'all';
  @override void initState() { super.initState(); ds = mockSellers; _sc.addListener(_f); }
  void _f() => setState(() => ds = _ar(_sc.text.isEmpty ? mockSellers : mockSellers.where((s) => s.name.toLowerCase().contains(_sc.text.toLowerCase())).toList()));
  List<Seller> _ar(List<Seller> src) { switch (_sf) { case '4.5': return src.where((s) => s.rating >= 4.5).toList(); case '4.7': return src.where((s) => s.rating >= 4.7).toList(); case '4.9': return src.where((s) => s.rating >= 4.9).toList(); default: return src; } }
  void _set(String f) { _sf = f; _f(); }
  @override void dispose() { _sc.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('البائعون')),
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(16), child: TextField(controller: _sc, decoration: InputDecoration(hintText: 'ابحث عن بائع...', prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))))),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [_chip('الكل', 'all'), const SizedBox(width: 8), _chip('4.5+', '4.5'), const SizedBox(width: 8), _chip('4.7+', '4.7'), const SizedBox(width: 8), _chip('4.9+', '4.9')]))),
        const SizedBox(height: 16),
        Expanded(child: ds.isEmpty
          ? Center(child: Text('لم نجد بائعين', style: TextStyle(color: Colors.grey[600])))
          : ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 16), itemCount: ds.length, itemBuilder: (c, i) => Padding(padding: const EdgeInsets.only(bottom: 12), child: SellerCard(seller: ds[i], onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => SellerDetailScreen(seller: ds[i]))))))),
      ]),
    );
  }
  Widget _chip(String label, String f) => FilterChip(label: Text(label), selected: _sf == f, onSelected: (_) => _set(f));
}

import 'package:flutter/material.dart';
import '../data/cart_manager.dart';
import '../theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override void initState() { super.initState(); CartManager.instance.addListener(_oc); }
  void _oc() { if (mounted) setState(() {}); }
  @override void dispose() { CartManager.instance.removeListener(_oc); super.dispose(); }

  @override Widget build(BuildContext context) {
    final items = CartManager.instance.items;
    return Scaffold(
      appBar: AppBar(title: const Text('السلة'), actions: [
        if (items.isNotEmpty) TextButton(onPressed: () { CartManager.instance.clear(); }, child: const Text('مسح الكل', style: TextStyle(color: DamasianTheme.error))),
      ]),
      body: items.isEmpty
        ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey[400]), const SizedBox(height: 16), const Text('السلة فارغة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), const SizedBox(height: 8), Text('ابدأ التسوق الآن', style: TextStyle(fontSize: 14, color: Colors.grey[600]))]))
        : Column(children: [
          Expanded(child: ListView.builder(itemCount: items.length, itemBuilder: (ctx, i) {
            final item = items[i];
            return Card(margin: const EdgeInsets.all(8), child: Padding(padding: const EdgeInsets.all(12), child: Row(children: [
              Container(width: 80, height: 80, decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: NetworkImage(item.image), fit: BoxFit.cover))),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text('${item.price.toStringAsFixed(0)} ر.س', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: DamasianTheme.primary)),
                const SizedBox(height: 8),
                Row(children: [
                  GestureDetector(onTap: () => CartManager.instance.updateQuantity(item.id, item.quantity - 1), child: Container(width: 24, height: 24, decoration: BoxDecoration(border: Border.all(color: DamasianTheme.border), borderRadius: BorderRadius.circular(4)), child: const Center(child: Text('−')))),
                  const SizedBox(width: 8),
                  Text(item.quantity.toString(), style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(width: 8),
                  GestureDetector(onTap: () => CartManager.instance.updateQuantity(item.id, item.quantity + 1), child: Container(width: 24, height: 24, decoration: BoxDecoration(border: Border.all(color: DamasianTheme.border), borderRadius: BorderRadius.circular(4)), child: const Center(child: Text('+')))),
                ]),
              ])),
              IconButton(icon: const Icon(Icons.delete_outline, color: DamasianTheme.error), onPressed: () => CartManager.instance.removeItem(item.id)),
            ])));
          })),
          Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey[300]!))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Row('الإجمالي الجزئي', '${CartManager.instance.subtotal.toStringAsFixed(0)} ر.س'),
            const SizedBox(height: 8), _Row('الشحن', '${CartManager.instance.shipping.toStringAsFixed(0)} ر.س'),
            const SizedBox(height: 8), _Row('الضريبة', '${CartManager.instance.tax.toStringAsFixed(0)} ر.س'),
            const SizedBox(height: 12), Container(height: 1, color: Colors.grey[300]), const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('الإجمالي', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('${CartManager.instance.total.toStringAsFixed(0)} ر.س', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: DamasianTheme.primary)),
            ]),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('إتمام الطلب'))),
          ])),
        ]),
    );
  }
}
class _Row extends StatelessWidget {
  final String label, value;
  const _Row(this.label, this.value);
  @override Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(fontSize: 14, color: DamasianTheme.textSecondary)), Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))]);
}

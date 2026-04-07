import '../models/models.dart';

class CartManager {
  static final CartManager instance = CartManager._();
  CartManager._();
  final List<CartItem> _items = [];
  final List<Function()> _listeners = [];
  List<CartItem> get items => List.unmodifiable(_items);
  int get totalCount => _items.fold(0, (sum, item) => sum + item.quantity);
  double get subtotal => _items.fold(0, (sum, item) => sum + item.totalPrice);
  double get shipping => _items.isNotEmpty ? 20 : 0;
  double get tax => (subtotal * 0.15).roundToDouble();
  double get total => subtotal + shipping + tax;
  void addListener(Function() l) => _listeners.add(l);
  void removeListener(Function() l) => _listeners.remove(l);
  void _notify() { for (final l in _listeners) { l(); } }
  void addItem(Product product) {
    final e = _items.where((i) => i.id == product.id).toList();
    if (e.isNotEmpty) { e.first.quantity++; } else { _items.add(CartItem(id: product.id, name: product.name, price: product.price, image: product.image)); }
    _notify();
  }
  void removeItem(String id) { _items.removeWhere((i) => i.id == id); _notify(); }
  void updateQuantity(String id, int q) { if (q <= 0) { removeItem(id); return; } final i = _items.where((x) => x.id == id).toList(); if (i.isNotEmpty) { i.first.quantity = q; _notify(); } }
  void clear() { _items.clear(); _notify(); }
}

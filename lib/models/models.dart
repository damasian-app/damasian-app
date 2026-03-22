// Product Model
class Product {
  final String id;
  final String name;
  final double price;
  final double originalPrice;
  final String image;
  final double rating;
  final int reviewCount;
  final String sellerId;
  final String sellerName;
  final String category;
  final String description;
  final List<String> images;
  final List<String> colors;
  final List<String> sizes;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.sellerId,
    required this.sellerName,
    required this.category,
    required this.description,
    required this.images,
    required this.colors,
    required this.sizes,
  });

  int get discountPercentage {
    return (((originalPrice - price) / originalPrice) * 100).toInt();
  }
}

// Seller Model
class Seller {
  final String id;
  final String name;
  final String image;
  final double rating;
  final int productCount;
  final int followers;
  final String description;

  Seller({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.productCount,
    required this.followers,
    required this.description,
  });
}

// Category Model
class Category {
  final String id;
  final String name;
  final String icon;

  Category({
    required this.id,
    required this.name,
    required this.icon,
  });
}

// Banner Model
class Banner {
  final String id;
  final String image;
  final String title;

  Banner({
    required this.id,
    required this.image,
    required this.title,
  });
}

// Cart Item Model
class CartItem {
  final String id;
  final String name;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
}

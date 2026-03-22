import '../models/models.dart';

// Mock Products
final List<Product> mockProducts = [
  Product(
    id: '1',
    name: 'حقيبة يد جلدية فاخرة',
    price: 200,
    originalPrice: 250,
    image: 'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=500&h=500&fit=crop',
    rating: 4.5,
    reviewCount: 128,
    sellerId: 'seller1',
    sellerName: 'متجر الفخامة',
    category: 'bags',
    description: 'حقيبة يد جلدية أصلية من أفضل الجلود الإيطالية، تصميم عصري وأنيق',
    images: [
      'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=500&h=500&fit=crop',
    ],
    colors: ['بني', 'أسود', 'أبيض'],
    sizes: ['صغير', 'متوسط', 'كبير'],
  ),
  Product(
    id: '2',
    name: 'ساعة ذكية فاخرة',
    price: 380,
    originalPrice: 450,
    image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&h=500&fit=crop',
    rating: 4.8,
    reviewCount: 256,
    sellerId: 'seller2',
    sellerName: 'متجر التقنية',
    category: 'electronics',
    description: 'ساعة ذكية بأحدث التقنيات، شاشة AMOLED، عمر بطارية 7 أيام',
    images: [
      'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&h=500&fit=crop',
    ],
    colors: ['فضي', 'ذهبي', 'أسود'],
    sizes: ['42mm', '46mm'],
  ),
  Product(
    id: '3',
    name: 'عطر فاخر',
    price: 120,
    originalPrice: 150,
    image: 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=500&h=500&fit=crop',
    rating: 4.3,
    reviewCount: 89,
    sellerId: 'seller3',
    sellerName: 'متجر العطور',
    category: 'beauty',
    description: 'عطر فرنسي الصنع برائحة فاخرة وثابتة، يدوم 8 ساعات',
    images: [
      'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=500&h=500&fit=crop',
    ],
    colors: ['شفاف'],
    sizes: ['50ml', '100ml'],
  ),
  Product(
    id: '4',
    name: 'حذاء رياضي عصري',
    price: 180,
    originalPrice: 220,
    image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&h=500&fit=crop',
    rating: 4.6,
    reviewCount: 342,
    sellerId: 'seller1',
    sellerName: 'متجر الفخامة',
    category: 'shoes',
    description: 'حذاء رياضي بتصميم حديث وراحة عالية، مناسب للرياضة واليومي',
    images: [
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&h=500&fit=crop',
    ],
    colors: ['أبيض', 'أسود', 'أزرق'],
    sizes: ['36', '37', '38', '39', '40', '41', '42', '43'],
  ),
  Product(
    id: '5',
    name: 'فستان سهرة أنيق',
    price: 280,
    originalPrice: 350,
    image: 'https://images.unsplash.com/photo-1595777707802-c0a0f2e5e0a5?w=500&h=500&fit=crop',
    rating: 4.7,
    reviewCount: 156,
    sellerId: 'seller4',
    sellerName: 'متجر الموضة',
    category: 'fashion',
    description: 'فستان سهرة بتصميم فاخر وأنيق، مناسب للمناسبات الخاصة',
    images: [
      'https://images.unsplash.com/photo-1595777707802-c0a0f2e5e0a5?w=500&h=500&fit=crop',
    ],
    colors: ['أسود', 'أحمر', 'ذهبي'],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    id: '6',
    name: 'سماعات رأس لاسلكية',
    price: 150,
    originalPrice: 200,
    image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&h=500&fit=crop',
    rating: 4.4,
    reviewCount: 203,
    sellerId: 'seller2',
    sellerName: 'متجر التقنية',
    category: 'electronics',
    description: 'سماعات رأس لاسلكية بصوت عالي الجودة وبطارية تدوم 30 ساعة',
    images: [
      'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&h=500&fit=crop',
    ],
    colors: ['أسود', 'فضي', 'أزرق'],
    sizes: ['One Size'],
  ),
];

// Mock Sellers
final List<Seller> mockSellers = [
  Seller(
    id: 'seller1',
    name: 'متجر الفخامة',
    image: 'https://images.unsplash.com/photo-1556740738-b6a63e27c4df?w=500&h=300&fit=crop',
    rating: 4.7,
    productCount: 150,
    followers: 5000,
    description: 'متجر متخصص في الملابس والحقائب الفاخرة',
  ),
  Seller(
    id: 'seller2',
    name: 'متجر التقنية',
    image: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=500&h=300&fit=crop',
    rating: 4.9,
    productCount: 200,
    followers: 8000,
    description: 'متجر متخصص في الإلكترونيات والأجهزة الذكية',
  ),
  Seller(
    id: 'seller3',
    name: 'متجر العطور',
    image: 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=500&h=300&fit=crop',
    rating: 4.6,
    productCount: 80,
    followers: 3000,
    description: 'متجر متخصص في العطور والعطور الفاخرة',
  ),
  Seller(
    id: 'seller4',
    name: 'متجر الموضة',
    image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=300&fit=crop',
    rating: 4.8,
    productCount: 120,
    followers: 6000,
    description: 'متجر متخصص في الملابس والموضة العصرية',
  ),
];

// Mock Categories
final List<Category> mockCategories = [
  Category(id: 'fashion', name: 'الموضة', icon: '👗'),
  Category(id: 'electronics', name: 'الإلكترونيات', icon: '📱'),
  Category(id: 'beauty', name: 'الجمال', icon: '💄'),
  Category(id: 'shoes', name: 'الأحذية', icon: '👞'),
  Category(id: 'bags', name: 'الحقائب', icon: '👜'),
  Category(id: 'home', name: 'المنزل', icon: '🏠'),
];

// Mock Banners
final List<Banner> mockBanners = [
  Banner(
    id: '1',
    image: 'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=1000&h=400&fit=crop',
    title: 'عروض صيفية حصرية',
  ),
  Banner(
    id: '2',
    image: 'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=1000&h=400&fit=crop',
    title: 'تخفيفات تصل إلى 50%',
  ),
  Banner(
    id: '3',
    image: 'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=1000&h=400&fit=crop',
    title: 'منتجات جديدة كل أسبوع',
  ),
];

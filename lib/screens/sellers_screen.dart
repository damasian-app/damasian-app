import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/models.dart';
import '../theme.dart';
import '../widgets/seller_card.dart';

class SellersScreen extends StatefulWidget {
  const SellersScreen({super.key});

  @override
  State<SellersScreen> createState() => _SellersScreenState();
}

class _SellersScreenState extends State<SellersScreen> {
  late List<Seller> displayedSellers;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedSellers = mockSellers;
    _searchController.addListener(_filterSellers);
  }

  void _filterSellers() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        displayedSellers = mockSellers;
      });
    } else {
      setState(() {
        displayedSellers = mockSellers
            .where((seller) => seller.name.toLowerCase().contains(query))
            .toList();
      });
    }
  }

  void _filterByRating(double minRating) {
    setState(() {
      displayedSellers = mockSellers
          .where((seller) => seller.rating >= minRating)
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('البائعون'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'ابحث عن بائع...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          // Filter Chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChip(
                    label: const Text('الكل'),
                    selected: true,
                    onSelected: (_) {
                      setState(() {
                        displayedSellers = mockSellers;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('⭐ 4.5+'),
                    selected: false,
                    onSelected: (_) => _filterByRating(4.5),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('⭐ 4.7+'),
                    selected: false,
                    onSelected: (_) => _filterByRating(4.7),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('⭐ 4.9+'),
                    selected: false,
                    onSelected: (_) => _filterByRating(4.9),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Sellers List
          Expanded(
            child: displayedSellers.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 48,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'لم نجد بائعين',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: displayedSellers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SellerCard(
                          seller: displayedSellers[index],
                          onTap: () {},
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

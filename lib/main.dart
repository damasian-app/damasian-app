import 'package:flutter/material.dart';

void main() {
  runApp(const DamasianApp());
}

class DamasianApp extends StatelessWidget {
  const DamasianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Damasian',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Damasian'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.storefront,
              size: 90,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Damasian',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Multi-vendor marketplace',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MarketplaceScreen(),
                  ),
                );
              },
              child: const Text('Enter Marketplace'),
            ),
          ],
        ),
      ),
    );
  }
}

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'name': 'Baby Blanket', 'price': '25 \$', 'seller': 'Angel Home'},
      {'name': 'Luxury Overall', 'price': '40 \$', 'seller': 'Damasian'},
      {'name': 'Gift Box', 'price': '15 \$', 'seller': 'Royal Touch'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                color: Colors.blue,
                size: 40,
              ),
              title: Text(
                product['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Seller: ${product['seller']}'),
              trailing: Text(
                product['price']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }


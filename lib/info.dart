import 'package:flutter/material.dart';

class GroceryInfoPage extends StatelessWidget {
  const GroceryInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About FreshMart Grocery'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Icon
            Center(
              child: Icon(
                Icons.local_grocery_store,
                size: 100,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),

            // Store Name & Tagline
            const Center(
              child: Text(
                'FreshMart Grocery',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Fresh produce, everyday essentials, delivered to your doorstep!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),

            // Who We Are
            const Text(
              'Who We Are',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'At FreshMart Grocery, we believe in providing the freshest fruits, vegetables, '
              'and everyday essentials for your family. We carefully source from trusted local '
              'farms and suppliers to ensure the highest quality products are always available. '
              'Convenience, freshness, and affordability are at the heart of everything we do.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 25),

            // Mission
            const Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'To make grocery shopping simple, healthy, and enjoyable. '
              'FreshMart ensures top-quality products, fair pricing, and fast delivery, '
              'helping families get the essentials they need without the hassle.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 25),

            // Our Promise
            const Text(
              'Our Promise',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '🥬 Fresh and Organic Produce\n'
              '🛒 Wide Range of Everyday Essentials\n'
              '🚚 Fast and Safe Delivery\n'
              '💰 Affordable Prices with Excellent Quality\n'
              '😊 Customer Happiness is Our Priority',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 25),

            // Contact Us
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '📍 123 Greenway Blvd, Butuan City, Philippines\n'
              '📞 +63 912 345 6789\n'
              '✉️ support@freshmartph.com',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 30),

            // Back Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

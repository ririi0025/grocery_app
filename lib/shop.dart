import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/product.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Fresh Apples',
      'price': 2.99,
      'image': 'https://3.imimg.com/data3/AW/LY/MY-4182816/fresh-apple.jpg',
      'vendor': 'Fruit Farm'
    },
    {
      'name': 'Bananas',
      'price': 1.49,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg',
      'vendor': 'Tropical Produce'
    },
    {
      'name': 'Whole Milk',
      'price': 3.25,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyw5lSvvG25z0GyNj1M5B0OO-3UN5K6dTVOA&s',
      'vendor': 'Dairy Best'
    },
    {
      'name': 'Brown Bread',
      'price': 2.10,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfSFiDfYqwJT_2Jqq3ILO5rbAXjvIcKyCHFw&s',
      'vendor': 'Baker’s Choice'
    },
    {
      'name': 'Eggs (12 pcs)',
      'price': 3.75,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxbQwGVPuqXB2yk4He63MSI_CdnjwFT9al0g&s',
      'vendor': 'Farm Fresh'
    },
    {
      'name': 'Tomatoes',
      'price': 1.85,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg',
      'vendor': 'Veggie Market'
    },
    {
      'name': 'Potatoes',
      'price': 2.40,
      'image':
          'https://cdn.mos.cms.futurecdn.net/iC7HBvohbJqExqvbKcV3pP-1920-80.jpg',
      'vendor': 'Harvest Goods'
    },
    {
      'name': 'Chicken Breast',
      'price': 6.50,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqiLOoehFbkmCw-BzHjyOCF9--GD4Aggp9hQ&s',
      'vendor': 'Poultry Pro'
    },
    {
      'name': 'Rice (1kg)',
      'price': 1.99,
      'image':
          'https://pacificbay.com.ph/cdn/shop/products/well-milled-rice-white-814818.jpg?v=1634812449',
      'vendor': 'Golden Grain'
    },
    {
      'name': 'Cooking Oil',
      'price': 4.20,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRTE5MTvyuBj6DfbTH00CvBo79x1iiF8lKRA&s',
      'vendor': 'Kitchen Essentials'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Grocery'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.add_shopping_cart, color: Colors.black),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Products',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Default')),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: const Text('A-Z')),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        color: Colors.grey,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              product['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                      child: Icon(Icons.image_not_supported)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text('\$${product['price'].toStringAsFixed(2)}'),
                              Text(product['vendor'],
                                  style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                            ),
                            IconButton(
                              onPressed: () {
                                cart.addItem(
                                  Product(
                                    id: index.toString(),
                                    name: product['name'],
                                    price: product['price'],
                                    vendor: product['vendor'],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.add_shopping_cart),
                            ),
                          ],
                        ),
                      ],
                    ),
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

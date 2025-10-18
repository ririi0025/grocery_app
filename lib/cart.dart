import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'My Basket',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      drawer: const AppDrawer(),

      body: Column(
        children: [
       
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your Items',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, size: 16),
                  label: const Text('Back'),
                ),
              ],
            ),
          ),

          Expanded(
            child: cartItems.isEmpty
                ? const Center(
                    child: Text(
                      'Your basket is empty 🛒',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 4),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueAccent.withOpacity(0.1),
                            child: const Icon(Icons.shopping_bag_outlined,
                                color: Colors.blueAccent),
                          ),
                          title: Text(
                            item.product.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          subtitle: Text(
                            '\$${item.product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              cartProvider.removeItem(item.product.id);
                            },
                            icon: const Icon(Icons.delete_outline,
                                color: Colors.redAccent),
                          ),
                        ),
                      );
                    },
                  ),
          ),

       
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: Visibility(
        visible: cartItems.isNotEmpty,
        child: FloatingActionButton.extended(
          onPressed: () {
          
          },
          backgroundColor: Colors.blueAccent,
          icon: const Icon(Icons.payment),
          label: const Text('Checkout'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


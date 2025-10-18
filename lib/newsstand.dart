import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';

class GroceryNewsstand extends StatefulWidget {
  const GroceryNewsstand({super.key});

  @override
  State<GroceryNewsstand> createState() => _GroceryNewsstandState();
}

class _GroceryNewsstandState extends State<GroceryNewsstand> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final List<String> news = args?['news'] ?? [
          'Fresh organic vegetables now in stock!',
          'Supermarket announces weekend discounts on fruits.',
          'New dairy products available from local farms.',
          'Delivery slots for online grocery now faster than ever.',
          'Special deals on cereals and bakery items this week.',
          'Customer favorite snacks restocked in all stores.',
          'Sustainable packaging introduced for grocery products.',
          'Healthy recipes and cooking tips added to the app.',
        ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grocery News',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF2D6A4F), // Fresh green
        elevation: 3,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Refreshing latest grocery news...'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD8F3DC), Color(0xFF95D5B2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Latest Grocery Updates',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B4332),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: news.isEmpty
                    ? const Center(
                        child: Text(
                          'No grocery news available at the moment.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: news.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.white.withOpacity(0.9),
                            elevation: 4,
                            child: ListTile(
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF52B788),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.local_grocery_store,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                              title: Text(
                                news[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              trailing: const Icon(Icons.chevron_right,
                                  size: 22, color: Colors.green),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Opening: ${news[index]}'),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF40916C),
        icon: const Icon(Icons.add),
        label: const Text('Add News'),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Feature coming soon: Add your own grocery news!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/info.dart';
import 'package:flutter_application_1/newsstand.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/shop.dart';
import 'package:flutter_applicationg_1/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/shop': (context) => const Shop(),
        '/newsstand': (context) => const Newsstand(),
        '/info': (context) => const InfoPage(),
        '/cart': (context) => const Cart(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Grocery')),
      drawer: AppDrawer(),
      body: Center(),
    );
  }
}


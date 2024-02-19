import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/products.dart';
import 'package:provider_sample/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
    create: (context) => CartProvider()
    ,child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProductsPage(),
    );
  }
}

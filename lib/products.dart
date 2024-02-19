import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/cart.dart';
import 'package:provider_sample/provider.dart';

import 'product_model.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartScreen()));
              },
              icon: const Icon(Icons.card_travel))
        ],
        title: const Text("products"),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product pro = products[index];
          return ListTile(
            leading: Container(
              width: 60,
              height: 60,
              color: pro.color,
            ),
            title: Text(pro.name),
            subtitle: Text(pro.price.toString()),
            trailing: Checkbox(
                value: cartProvider.item.contains(pro),
                onChanged: (value) {
                  if (value == true) {
                    cartProvider.add(pro);
                  } else {
                    cartProvider.remove(pro);
                  }
                }),
          );
        },
      )),
    );
  }
}

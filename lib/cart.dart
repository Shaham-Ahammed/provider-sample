import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/product_model.dart';
import 'package:provider_sample/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            title: const Text("cart")),
        body: Consumer<CartProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.item.length,
                    itemBuilder: (context, index) {
                      Product pro = provider.item[index];
                      return ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          color: pro.color,
                        ),
                        title: Text(pro.name),
                        onLongPress: () {
                          provider.remove(pro);
                        },
                        subtitle: Text(pro.price.toString()),
                      );
                    },
                  ),
                ),
                Text("total is ${provider.cartTotal()}")
              ],
            );
          },
        ));
  }
}

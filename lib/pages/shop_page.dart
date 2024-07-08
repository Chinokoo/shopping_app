import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/drawer.dart';
import 'package:shopping_app/components/product_tile.dart';
import 'package:shopping_app/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access the products in shop
    final products = context.watch<Shop>().products;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Center(child: Text("Shopping ")),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart_page");
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                Provider.of<Shop>(context, listen: false).toggleTheme();
              },
              icon: (Theme.of(context).brightness == Brightness.light
                  ? const Icon(Icons.nightlight_round)
                  : const Icon(Icons.wb_sunny)))
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(children: [
        const SizedBox(
          height: 25,
        ),
        Center(
          child: Text(
            "Pick your favorite products",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 550,
          child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //get each product from the shop
                final product = products[index];

                //return as a product tile UI
                return ProductTile(product: product);
              }),
        ),
      ]),
    );
  }
}

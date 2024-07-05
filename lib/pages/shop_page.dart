import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/drawer.dart';
import 'package:shopping_app/components/list_tile.dart';
import 'package:shopping_app/components/product_tile.dart';
import 'package:shopping_app/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access the products in shop
    //!don't know what just happened here.
    final products = context.watch<Shop>().products;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 0,
          title: const Center(child: Text("Shopping "))),
      drawer: const MyDrawer(),
      body: ListView(children: [
        SizedBox(
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
              padding: EdgeInsets.all(15),
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

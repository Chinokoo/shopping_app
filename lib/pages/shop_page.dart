import 'package:flutter/material.dart';
import 'package:shopping_app/components/drawer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 0,
          title: const Center(child: Text("Shopping "))),
      drawer: const MyDrawer(),
    );
  }
}

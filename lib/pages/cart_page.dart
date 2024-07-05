import 'package:flutter/material.dart';
import 'package:shopping_app/components/drawer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text('Cart Page'),
        ),
        elevation: 0,
      ),
      drawer: const MyDrawer(),
    );
  }
}

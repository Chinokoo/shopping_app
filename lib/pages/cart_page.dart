import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/button.dart';
import 'package:shopping_app/components/drawer.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //method to remove item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              content: const Text("Remove Item from Cart?"),
              actions: [
                //cancel button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                //Yes button
                TextButton(
                  onPressed: () {
                    //close dialog box
                    Navigator.pop(context);

                    //remove from cart
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: const Text("Yes"),
                ),
              ],
            ));
  }

  //show pay dialog
  void showPayDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              content: const Text("User wants to pay, connecting to backend."),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().userCart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text('Cart Page'),
        ),
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    //get individual item from the cart
                    final item = cart[index];

                    //return as a cart tile UI
                    return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ));
                  })),
          Button(
              onTap: () => showPayDialog(context),
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(20),
                  child: const Text("PAY NOW"))),
        ],
      ),
    );
  }
}

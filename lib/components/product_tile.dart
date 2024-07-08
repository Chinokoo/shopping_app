import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/shop.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  //add To cart button when pressed

  void addToCart(BuildContext context) {
    // show a dialog box to confirm adding to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              content: const Text("Add this item to your cart?"),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                //Yes button
                MaterialButton(
                  onPressed: () {
                    //close dialog box
                    Navigator.pop(context);

                    //add to cart
                    context.read<Shop>().addToCart(product);
                  },
                  child: const Text("Yes"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10)),
                    width: double.infinity,
                    //image assets
                    child: Image.asset(
                      product.imagePath,
                      width: 100,
                    )),
              ),
              const SizedBox(
                height: 3,
              ),
              //Product name
              Text(
                product.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              //product description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          //product price + add to cart button
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //product price
            Text("\$${product.price.toStringAsFixed(2)}"),

            //add to cart button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(Icons.add)),
            )
          ]),
        ],
      ),
    );
  }
}

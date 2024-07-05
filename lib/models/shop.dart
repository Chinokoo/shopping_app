import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale.

  final List<Product> _shop = [
    //product 1
    Product(
      name: 'Widget Pro', price: 99.99,
      description: 'The ultimate widget for all your needs',
      //imagePath: 'assets/images/widget.png'
    ),
    //product 2
    Product(
      name: 'Gadget Gizmo',
      price: 24.50, description: 'A multi-purpose gadget for everyday use',
      //imagePath: 'assets/images/gadget.jpg'
    ),
    //product 3
    Product(
      name: 'Tech Toy',
      price: 14.99, description: 'An educational toy to learn about technology',
      //imagePath: 'assets/images/toy.png'
    ),
  ];

  // user cart
  List<Product> _cart = [];
  //get Product list
  List<Product> get products => _shop;

  //get user cart
  List<Product> get userCart => _cart;

  //add item to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}

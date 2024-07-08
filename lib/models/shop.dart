import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/themes/theme.dart';

class Shop extends ChangeNotifier {
  //products for sale.

  final List<Product> _shop = [
    //product 1
    Product(
        name: 'Widget Pro',
        price: 99.99,
        description: 'The ultimate widget for all your needs',
        imagePath: 'lib/images/glasses.png'),
    //product 2
    Product(
        name: 'Gadget Gizmo',
        price: 24.50,
        description: 'A multi-purpose gadget for everyday use',
        imagePath: 'lib/images/watch.jpg'),
    //product 3
    Product(
        name: 'Tech Toy',
        price: 14.99,
        description: 'An educational toy to learn about technology',
        imagePath: 'lib/images/hoddie.webp'),
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

  //theme

  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
      notifyListeners();
    } else {
      themeData = lightMode;
      notifyListeners();
    }
    notifyListeners();
  }
}

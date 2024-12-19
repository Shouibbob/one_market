import 'package:flutter/material.dart';

class ProductItem {
  String name;
  double price;
  int quantity;
  ProductItem(
      {required this.name, required this.price, required this.quantity});
}

class ProductProvider with ChangeNotifier {
  List<ProductItem> cartItems = [];

  void addToCart(ProductItem item) {
    cartItems.add(item);
    notifyListeners();
  }
}

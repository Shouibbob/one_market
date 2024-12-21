import 'package:flutter/material.dart';

class ProductItem {
  String name;
  String price;
  int quantity;
  ProductItem(
      {required this.name, required this.price, required this.quantity});
}

class ProductProvider with ChangeNotifier {
  List<ProductItem> productItems = [];

  void addToCart(ProductItem item) {
    productItems.add(item);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  // List<Product> _items = [];

  List<Product> get items => [..._items]; // [..._items] é um clone da lista _items.

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  // List<Product> _items = [];

  List<Product> get items => [..._items]; // [..._items] é um clone da lista _items.
  List<Product> get fvoriteItems => _items.where((product) => product.isFavorite).toList(); // [..._items] é um clone da lista _items.

  int get itemCount {
    return _items.length;
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}



//  bool _showFavoriteOnly = false;
 

//   List<Product> get items {
//     if (_showFavoriteOnly) {
//       return _items.where((product) => product.isFavorite).toList();
//     }
//     return [..._items]; // [..._items] é um clone da lista _items.
//   }

//   void showFavoriteOnly() {
//     _showFavoriteOnly = true;
//     notifyListeners();
//   }

//   void showAll() {
//     _showFavoriteOnly = false;
//     notifyListeners();
//   }

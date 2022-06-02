import 'dart:convert';
import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get all {
    return [..._products];
  }

  int get count {
    return _products.length;
  }

  void put(Product product) {
    _products.add(product);
    notifyListeners();
  }
}

class Product {
  String id = "", name = "", description = "", price = "";
  Product();
}

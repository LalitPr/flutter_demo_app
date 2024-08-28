import 'package:flutter/material.dart';

import '../core/api/model/product.dart';

class CartStore extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  // Add product to cart
  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  // Remove product from cart
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  // Get total price of items in cart
  String get totalPrice {
    double totalPrice = _cartItems.fold(0, (sum, item) => sum + item.price);
    return totalPrice.toStringAsFixed(2);
  }
}

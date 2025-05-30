import 'dart:async';
import 'package:flutter/material.dart';

class ApplicationState extends ChangeNotifier {
  var cartList = [];
  ApplicationState() {
    shoppingCart(cartList);
  }
  Future<void> shoppingCart(currentItem) async {
    if (cartList.contains(currentItem)) {
      cartList.remove(currentItem);

    } else {
      cartList.add(currentItem);

    }
    notifyListeners();
  }

  getCartItemsStream() {}
}

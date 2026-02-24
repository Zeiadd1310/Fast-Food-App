import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  int itemCount = 0;
  double deliveryFee = 0.30;
  double totalPrice = 0.0;

  void addItem() {
    itemCount++;
    notifyListeners();
    calculateTotalPrice();
  }

  void removeItem() {
    if (itemCount > 0) {
      itemCount--;
      calculateTotalPrice();
    }
    notifyListeners();
  }

  void calculateTotalPrice() {
    if (itemCount > 0) {
      totalPrice = (itemCount * 2.20) + deliveryFee;
    } else {
      totalPrice = 0;
    }
    notifyListeners();
  }
}

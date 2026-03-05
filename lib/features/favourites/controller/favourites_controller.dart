import 'package:depi/features/home/models/product_model.dart';
import 'package:flutter/material.dart';

class FavouritesController extends ChangeNotifier {
  List<Products> favouritesList = [];

  void addToFavourites(Products product) {
    if (!favouritesList.any((item) => item.id == product.id)) {
      favouritesList.add(product);
      notifyListeners();
    }
  }

  void removeFromFavourites(int productId) {
    favouritesList.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  bool isFavourite(int productId) {
    return favouritesList.any((item) => item.id == productId);
  }

  void toggleFavourite(Products product) {
    if (isFavourite(product.id ?? 0)) {
      removeFromFavourites(product.id ?? 0);
    } else {
      addToFavourites(product);
    }
  }
}

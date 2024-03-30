import 'package:flutter/material.dart';
import 'package:pickmed/core/model/shopping_cart.dart';
import 'package:pickmed/core/others/base_view_model.dart';

class ShoppingCartViewModel extends BaseViewModel {
  List<ShoppingCart> shoppingCartList = [
    ShoppingCart(imgUrl: 'img1', title: 'Cap. Celebrex', rm: '40.0'),
    ShoppingCart(imgUrl: 'img2', title: 'Cap. Tramadol', rm: '20.0'),
    ShoppingCart(imgUrl: 'img3', title: 'Tab.  Ibuprofen', rm: '10.0'),
    ShoppingCart(imgUrl: 'img1', title: 'Cap. Celebrex', rm: '40.0'),
    ShoppingCart(imgUrl: 'img2', title: 'Cap. Tramadol', rm: '20.0'),
    ShoppingCart(imgUrl: 'img3', title: 'Tab.  Ibuprofen', rm: '10.0'),
  ];

  // Initialize quantities list as an empty list
  List<int> quantities = [];

  ShoppingCartViewModel() {
    // Initialize quantities list with 1 for each item in shoppingCartList
    quantities = List.filled(shoppingCartList.length, 1);
  }

  // Increment the quantity of a specific item
  void increment(int index) {
    if (index >= 0 && index < quantities.length) {
      quantities[index]++;
      shoppingCartList[index].quantity = quantities[index];
      notifyListeners();
    }
  }

  // Decrement the quantity of a specific item
  void decrement(int index) {
    if (index >= 0 && index < quantities.length && quantities[index] > 1) {
      quantities[index]--;
      shoppingCartList[index].quantity = quantities[index];
      notifyListeners();
    }
  }

  // Remove an item from the shoppingCartList by index
  void removeItem(int index) {
    if (index >= 0 && index < shoppingCartList.length) {
      shoppingCartList.removeAt(index);
      notifyListeners();
    }
  }
}

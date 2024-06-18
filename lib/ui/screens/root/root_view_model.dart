// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/ui/screens/home/home_screen2.dart';
import 'package:pickmed/ui/screens/shopping_cart/shopping_cart_screen.dart';
import 'package:pickmed/ui/screens/user_side/home/user_home_screen.dart';

class RootScreenViewModel extends BaseViewModel {
  int selectedScreen = 0;

  RootScreenViewModel(val) {
    updatedScreen(val);
    notifyListeners();
  }

  List<Widget> allScreen = [
    UserHomeScreen(),
    // HomeScreen(),

    ShoppingCartcreen(),
  ];

  updatedScreen(int index) {
    setState(ViewState.busy);
    selectedScreen = index;
    setState(ViewState.idle);
    // selectIndex = index;
    notifyListeners();
  }
}

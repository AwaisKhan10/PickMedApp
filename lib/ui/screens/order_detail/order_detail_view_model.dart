import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/order_list.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/ui/screens/clinic_staff/clinic_staff_screen.dart';

class OrderDetailViewModel extends BaseViewModel {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  // Method to update the status of the order
  void updateOrderStatus(OrderList order, String newStatus) {
    // Update the status of the order
    order.status = newStatus;

    // Set the view state to notify listeners
    _state = ViewState.busy;

    notifyListeners();

    _state = ViewState.idle;

    notifyListeners();
  }
}

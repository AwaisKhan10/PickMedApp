import 'package:flutter/material.dart';
import 'package:pickmed/core/model/order_list.dart';
import 'package:pickmed/core/others/base_view_model.dart';

class ClientStaffViewModel extends BaseViewModel {
  final fmkey = GlobalKey<FormState>();

  List<OrderList> orderList = [
    OrderList(username: 'Awais khan', totalRm: '0.00', status: 'In Progess'),
    OrderList(username: 'Ali Akbar', totalRm: '0.00', status: 'Completed'),
    OrderList(username: 'Anees', totalRm: '0.00', status: 'Rejected'),
    OrderList(username: 'Usman', totalRm: '0.00', status: 'Completed'),
  ];

  void refreshOrderList() {
    // Call your method to fetch order list data again
    // For example:
    OrderList();
    notifyListeners(); // Notify listeners to update the UI
  }
}

import 'package:flutter/material.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/order.dart';
import 'package:pickmed/core/model/order_list.dart';
import 'package:pickmed/core/model/response/order_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/data_base_services.dart';

class ClientStaffViewModel extends BaseViewModel {
  final fmkey = GlobalKey<FormState>();
  final _db = DatabaseService();
  List<Orders> orders = [];

  // List<OrderList> orderList = [
  //   OrderList(username: 'Awais khan', totalRm: '0.00', status: 'In Progess'),
  //   OrderList(username: 'Ali Akbar', totalRm: '0.00', status: 'Completed'),
  //   OrderList(username: 'Anees', totalRm: '0.00', status: 'Rejected'),
  //   OrderList(username: 'Usman', totalRm: '0.00', status: 'Completed'),
  // ];

  ClientStaffViewModel() {
    getOrderList();
  }

  getOrderList() async {
    setState(ViewState.busy);
    OrdersResponse response = await _db.getOrderList();
    if (response.success == true) {
      orders = response.orders;
      notifyListeners();
    }
    setState(ViewState.idle);
    notifyListeners(); // Notify listeners to update the UI
  }

  void refreshOrderList() {
    // Call your method to fetch order list data again
    // For example:
    OrderList();
    notifyListeners(); // Notify listeners to update the UI
  }
}

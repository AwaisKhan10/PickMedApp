import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pickmed/core/constants/order_status.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/order.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/data_base_services.dart';
import 'package:pickmed/locator.dart';

class OrderDetailViewModel extends BaseViewModel {
  final _db = locator<DatabaseService>();
  Orders orderList = Orders();
  late String orderStatus;

  OrderDetailViewModel(this.orderList);
  // ViewState _state = ViewState.idle;
  // ViewState get state => _state;

  // // Method to update the status of the order
  // void updateOrderStatus(OrderList order, String newStatus) {
  //   // Update the status of the order
  //   order.status = newStatus;

  //   // Set the view state to notify listeners
  //   _state = ViewState.busy;

  //   notifyListeners();

  //   _state = ViewState.idle;

  //   notifyListeners();
  // }

  getUpdateOrderStatus({bool? isCompleted}) async {
    setState(ViewState.busy);
    if (isCompleted ?? false) {
      orderStatus = OrderStatus.deliver;
    } else {
      orderStatus = OrderStatus.cancelled;
    }
    bool isDone = await _db.updateOrderStatus(
        orderId: orderList.sId!, orderStatus: orderStatus);
    if (isDone) {
      Get.back(result: true);
      Get.snackbar(
        "Alert!",
        isCompleted ?? false
            ? "Order Completed successfully"
            : "Order Cancelled successfully",
      );
    }
    setState(ViewState.idle);
  }
}

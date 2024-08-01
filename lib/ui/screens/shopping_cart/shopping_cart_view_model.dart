import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/cart.dart';
import 'package:pickmed/core/model/response/cart_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/data_base_services.dart';
import 'package:pickmed/ui/screens/root/root_screen.dart';

class ShoppingCartViewModel extends BaseViewModel {
  final db = DatabaseService();
  List<Cart> cartItems = [];
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  double totalPrice = 0.0;

  // List<ShoppingCart> shoppingCartList = [
  //   ShoppingCart(imgUrl: 'img1', title: 'Cap. Celebrex', rm: '40.0'),
  //   ShoppingCart(imgUrl: 'img2', title: 'Cap. Tramadol', rm: '20.0'),
  //   ShoppingCart(imgUrl: 'img3', title: 'Tab.  Ibuprofen', rm: '10.0'),
  //   ShoppingCart(imgUrl: 'img1', title: 'Cap. Celebrex', rm: '40.0'),
  //   ShoppingCart(imgUrl: 'img2', title: 'Cap. Tramadol', rm: '20.0'),
  //   ShoppingCart(imgUrl: 'img3', title: 'Tab.  Ibuprofen', rm: '10.0'),
  // ];

  // Initialize quantities list as an empty list
  List<int> quantities = [];

  ShoppingCartViewModel() {
    // Initialize quantities list with 1 for each item in shoppingCartList
    // quantities = List.filled(shoppingCartList.length, 1);
    initializeNotifications();
    getCartItems();
  }

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id', // channel ID
      'your_channel_name', // channel name
      importance: Importance.max,
      priority: Priority.high,
      icon: "@mipmap/ic_launcher",
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // notification ID
      'Order Confirmed!', // notification title
      'Your order has been successfully checked out.', // notification body
      platformChannelSpecifics,
    );
  }

  getCartItems() async {
    setState(ViewState.busy);
    CartResponse response = await db.getCartItem();
    if (response.success == true) {
      cartItems = response.cartItems;

      totalPrice = cartItems.fold(
          0,
          (previousValue, element) =>
              previousValue + double.parse(element.subtotal.toString()));
    }
    setState(ViewState.idle);
    notifyListeners();
  }

  // Increment the quantity of a specific item
  // void increment(int index) {
  //   if (index >= 0 && index < quantities.length) {
  //     quantities[index]++;
  //     cartItems[index].cartQuantity = cartItems[index].cartQuantity! + 1;
  //     cartItems[index].subtotal = quantities[index];
  //     // shoppingCartList[index].quantity = quantities[index];
  //     notifyListeners();
  //   }
  // }

  void increment(int index) async {
    setState(ViewState.busy);
    cartItems[index].cartQuantity = cartItems[index].cartQuantity! + 1;
    totalPrice = totalPrice + cartItems[index].price!;
    setState(ViewState.idle);
    notifyListeners();
  }

  void decrement(int index) async {
    setState(ViewState.busy);
    if (cartItems[index].cartQuantity! > 1) {
      cartItems[index].cartQuantity = cartItems[index].cartQuantity! - 1;
      totalPrice = totalPrice - cartItems[index].price!;
    }
    setState(ViewState.idle);
    notifyListeners();
  }

  // Decrement the quantity of a specific item
  // void decrement(int index) {
  //   if (index >= 0 && index < quantities.length && quantities[index] > 1) {
  //     quantities[index]--;
  //     cartItems[index].cartQuantity = cartItems[index].cartQuantity! - 1;
  //     cartItems[index].subtotal = quantities[index];
  //     // shoppingCartList[index].quantity = quantities[index];
  //     notifyListeners();
  //   }
  // }

  // Remove an item from the shoppingCartList by index
  void removeItem(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
      // shoppingCartList.removeAt(index);
      notifyListeners();
    }
  }

  emptyCart() async {
    setState(ViewState.busy);
    bool isDone = await db.checkout();
    if (isDone) {
      bool isDone = await db.emptyCart();

      if (isDone) {
        showNotification();
        Get.offAll(const RootScreen());
      }
    }
    setState(ViewState.idle);
    notifyListeners();
  }
}

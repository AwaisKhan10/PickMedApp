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
    getCartItems();
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
  void increment(int index) {
    if (index >= 0 && index < quantities.length) {
      quantities[index]++;
      cartItems[index].subtotal = quantities[index];
      // shoppingCartList[index].quantity = quantities[index];
      notifyListeners();
    }
  }

  // Decrement the quantity of a specific item
  void decrement(int index) {
    if (index >= 0 && index < quantities.length && quantities[index] > 1) {
      quantities[index]--;

      cartItems[index].subtotal = quantities[index];
      // shoppingCartList[index].quantity = quantities[index];
      notifyListeners();
    }
  }

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
    bool isDone = await db.emptyCart();
    if (isDone) {
      bool isDone = await db.checkout();
      if (isDone) {
        Get.offAll(const RootScreen());
      }
    }
    setState(ViewState.idle);
    notifyListeners();
  }
}

import 'package:fudiee/constants/data.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = cartData.obs;

  onIncreaseItemCount(index) {
    cartItems[index].itemCount++;
    update(['cart_item_action_widget']);
  }

  onDecreaseItemCount(index) {
    if (cartItems[index].itemCount > 1) {
      cartItems[index].itemCount--;
      update(['cart_item_action_widget']);
    }
  }

  rate(index, rating) {
    var cart = cartItems[index];
    cart.rating = rating;
    update(['cart_view']);
  }
}

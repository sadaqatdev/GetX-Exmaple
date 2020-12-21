import 'package:get/state_manager.dart';
import 'package:getx_new_pratice/models/product.dart';

class CartController extends GetxController {
  var carItem = List<Product>().obs;
  int get totalItems => carItem.length;
  double get totalPrice => carItem.fold(
      0, (previousValue, element) => previousValue + element.price);
  addIteam(Product product) {
    carItem.add(product);
  }
}

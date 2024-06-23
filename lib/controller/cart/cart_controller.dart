import 'package:ecom_matrix/model/cart/cart_products_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CartController extends GetxController {
  RxBool _isLoading = false.obs;
  set setLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  RxBool isLongPressed = false.obs;
  RxList selecteIndexList = [].obs;
  RxList cartProductsList = [
    CartProductsModel(
        title: 'Product 1',
        size: 'M',
        color: 'Black',
        quantity: 1,
        price: 3000),
    CartProductsModel(
        title: 'Product 2', size: 'L', color: 'Red', quantity: 1, price: 3500),
    CartProductsModel(
        title: 'Product 1',
        size: 'M',
        color: 'Black',
        quantity: 1,
        price: 3000),
    CartProductsModel(
        title: 'Product 2', size: 'L', color: 'Red', quantity: 1, price: 3500),
    CartProductsModel(
        title: 'Product 1',
        size: 'M',
        color: 'Black',
        quantity: 1,
        price: 3000),
    CartProductsModel(
        title: 'Product 2', size: 'L', color: 'Red', quantity: 1, price: 3500),
    CartProductsModel(
        title: 'Product 1',
        size: 'M',
        color: 'Black',
        quantity: 1,
        price: 3000),
    CartProductsModel(
        title: 'Product 2', size: 'L', color: 'Red', quantity: 1, price: 3500),
  ].obs;

  removeCartProduct() {
    selecteIndexList.sort((a, b) => b.compareTo(a));
    for (int i = 0; i < selecteIndexList.length; i++) {
      cartProductsList.removeAt(selecteIndexList[i]);
    }
    selecteIndexList.clear();
    isLongPressed.value = false;
  }

  void incrementQuantity(int index) {
    cartProductsList[index].quantity++;
    cartProductsList.refresh();
  }

  void decrementQuantity(int index) {
    if (cartProductsList[index].quantity > 1) {
      cartProductsList[index].quantity--;
      cartProductsList.refresh();
    }
  }

  //=====================
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartProducts();
  }

  //=====================
  getCartProducts() {
    setLoading = true;
    update();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setLoading = false;
      },
    );
  }
}

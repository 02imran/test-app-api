import 'package:get/get.dart';
import 'package:test_app/models/product_model.dart';
import 'package:test_app/repositoris/product_repository.dart';

class ProdcutController extends GetxController {
  RxList<ProductsModel> productOfferList = <ProductsModel>[].obs;
  RxBool productDataLoaded = false.obs;
  RxList<ProductsModel> productOfferListAll = <ProductsModel>[].obs;
  RxBool productAllDataLoaded = false.obs;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInit() {
    getProductList();
    getProductListAll();
    super.onInit();
  }

  void getProductList() {
    ProductRepository().getProduct().then((value) {
      productOfferList.clear();
      productOfferList.addAll(value!);
      productDataLoaded.value = true;
    }).catchError((error) {
      Get.back();
      Get.snackbar(
        'Server Error',
        error.toString(),
      );
    });
  }

  //all data
  void getProductListAll() {
    ProductRepository().getProductList().then((value) {
      productOfferListAll.clear();
      productOfferListAll.addAll(value!);
      productAllDataLoaded.value = true;
    }).catchError((error) {
      Get.back();
      Get.snackbar(
        'Server Error',
        error.toString(),
      );
    });
  }
}

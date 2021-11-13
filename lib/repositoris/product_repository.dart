import 'dart:convert';
import 'package:get/get.dart';
import 'package:test_app/models/product_model.dart';

class ProductRepository extends GetConnect {
  Map<String, String> demoProduct = {
    "Accept": "application/json",
  };

  Future<List<ProductsModel>?> getProduct() async {
    List<ProductsModel> products = [];

    try {
      final Response response =
          await get('https://fakestoreapi.com/products?limit=4', headers: demoProduct);

      print('products  code :' + response.statusCode.toString());
      print('products res :' + response.body.toString());

      String code = response.statusCode.toString();
      if (code == '200' || code == '201' || code == '202') {
        for (var productList in jsonDecode(response.bodyString!)) {
          products.add(ProductsModel.fromJson(productList));
        }
        print(products.length);

        return products;
      } else {
        print('error ' + code.toString());
      }
    } catch (exception) {
      print('exp : ' + exception.toString());
    }
  }
Future<List<ProductsModel>?> getProductList() async {
    List<ProductsModel> products = [];

    try {
      final Response response =
          await get('https://fakestoreapi.com/products', headers: demoProduct);

      print('products  code :' + response.statusCode.toString());
      print('products res :' + response.body.toString());

      String code = response.statusCode.toString();
      if (code == '200' || code == '201' || code == '202') {
        for (var productList in jsonDecode(response.bodyString!)) {
          products.add(ProductsModel.fromJson(productList));
        }
        print(products.length);

        return products;
      } else {
        print('error ' + code.toString());
      }
    } catch (exception) {
      print('exp : ' + exception.toString());
    }
  }

}

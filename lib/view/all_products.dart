import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/product_controller.dart';
import 'package:test_app/view/product_details.dart';

class AllProducts extends StatelessWidget {
  AllProducts({Key? key}) : super(key: key);

  ProdcutController prodcutControllerAll = Get.put(ProdcutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'All Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return Expanded(
                  child: GridView.builder(
                      itemCount:
                          prodcutControllerAll.productOfferListAll.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.60),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(ProductDetails(prodcutControllerAll
                                .productOfferListAll[index]));
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      height: 180,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Image.network(
                                        prodcutControllerAll
                                            .productOfferListAll[index].image
                                            .toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Expanded(
                                    flex: 2,
                                    child: Text(prodcutControllerAll
                                        .productOfferListAll[index].title
                                        .toString()),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('৳' +
                                            prodcutControllerAll
                                                .productOfferListAll[index]
                                                .price
                                                .toString()),
                                        Row(
                                          children: [
                                            const Icon(Icons.star,
                                                size: 18, color: Colors.yellow),
                                            Text(prodcutControllerAll
                                                .productOfferListAll[index]
                                                .rating!
                                                .rate
                                                .toString())
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

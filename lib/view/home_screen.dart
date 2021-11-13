import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/product_controller.dart';
import 'package:test_app/view/all_products.dart';
import 'package:test_app/view/product_details.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ProdcutController prodcutController = Get.put(ProdcutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(width: 5),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          SizedBox(width: 20)
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'E-commerse site',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                hintText: 'Search Here',
                prefixIcon: const Icon(Icons.search),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Categoris',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    Get.to(AllProducts());
                  },
                  child: const Text('See All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                )
              ],
            ),
            const SizedBox(height: 20),
            Obx(() {
              return Expanded(
                child: GridView.builder(
                    itemCount: prodcutController.productOfferList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.60),
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(ProductDetails(
                              prodcutController.productOfferList[index]));
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
                                      prodcutController
                                          .productOfferList[index].image
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Expanded(
                                  flex: 2,
                                  child: Text(prodcutController
                                      .productOfferList[index].title
                                      .toString()),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('৳' +
                                          prodcutController
                                              .productOfferList[index].price
                                              .toString()),
                                      Row(
                                        children: [
                                          const Icon(Icons.star,
                                              size: 18, color: Colors.yellow),
                                          Text(prodcutController
                                              .productOfferList[index]
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
    );
  }
}

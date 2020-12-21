import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_pratice/controllers/cart_controller.dart';
import 'package:getx_new_pratice/controllers/shoping_controller.dart';
import 'package:getx_new_pratice/views/new_screen.dart';

class Shoping extends StatefulWidget {
  @override
  _ShopingState createState() => _ShopingState();
}

class _ShopingState extends State<Shoping> {
  final controller = Get.put(ShopingController());

  final carController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: GetX<ShopingController>(
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.products[index].productName}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                      '${controller.products[index].productDescription}'),
                                ],
                              ),
                              Text('\$${controller.products[index].price}',
                                  style: TextStyle(fontSize: 24)),
                            ],
                          ),
                          RaisedButton(
                            onPressed: () {
                              carController
                                  .addIteam(controller.products[index]);
                            },
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text('Add to Cart'),
                          ),
                          Obx(() => IconButton(
                                icon: controller
                                        .products[index].isFavorite.value
                                    ? Icon(Icons.check_box_rounded)
                                    : Icon(
                                        Icons.check_box_outline_blank_outlined),
                                onPressed: () {
                                  controller.products[index].isFavorite
                                      .toggle();
                                },
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        GetX<CartController>(builder: (controller) {
          return Text('Total Amount ${controller.totalPrice}');
        }),
        SizedBox(height: 100)
      ]),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_shopping_cart),
        label: GetX<CartController>(builder: (controller) {
          return Text('Total Items ${controller.totalItems}');
        }),
        onPressed: () {
          Get.defaultDialog(
              title: 'asdasdasda', content: Text('assdsdsdc sfsf s f'));
          // Get.to(NewScreen());
        },
      ),
    );
  }
}

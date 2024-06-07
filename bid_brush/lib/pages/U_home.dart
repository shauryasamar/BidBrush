import 'package:bid_brush/controllers/user_h_controller.dart';

import 'package:bid_brush/pages/page_auction.dart';
import 'package:bid_brush/pages/user_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Checkout.dart';
// import 'auction.dart';

class UHome extends StatefulWidget {
  const UHome({super.key});

  @override
  State<UHome> createState() => _UHomeState();
}

class _UHomeState extends State<UHome> {
  double totalAmount = 100;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserHomeController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              // Banner showing featured artwork or promotions
              const SizedBox(height: 5.0),

              // Popular categories section
              // const Text('Your Digital Art Gallery'),
              const SizedBox(height: 5.0),
              Wrap(
                spacing: 20.0,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const UserHome());
                    },
                    child: const Text('Painting'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(AuctionPage());
                    },
                    child: const Text('Auction'),
                  ),
                  // Add more category buttons
                ],
              ),
              const SizedBox(height: 5.0),

              // Featured artwork section
              const Text(''),
              const SizedBox(height: 5.0),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.productList
                    .length, // Replace with actual number of artworks
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 50.0,
                    childAspectRatio: 0.7),
                itemBuilder: (context, index) {
                  var productItem = controller.productList[index];
                  return InkWell(
                    onTap: () {}, // Navigate to artwork details page
                    child: Card(
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              productItem.image ?? '',
                              height: 150,
                              width: Get.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productItem.name ?? '',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${productItem.price}',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                Colors.purple),
                                      ),
                                      onPressed: () {
                                        Get.to(Checkout(
                                            totalAmount:
                                                productItem.price ?? 0));
                                      },
                                      child: const Text(
                                        'BUY',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10.0),

              // More sections... (e.g., new arrivals, artist spotlights, recommendations)
            ],
          ),
        ),
      );
    });
  }
}

import 'package:bid_brush/controllers/artist_h_controller.dart';
import 'package:bid_brush/pages/artist_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_for_auction.dart';
// import 'auction.dart';



class AHome extends StatefulWidget {
  const AHome({super.key});

  @override
  State<AHome> createState() => _AHomeState();
}

class _AHomeState extends State<AHome> {
  double totalAmount = 100;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArtistHController>(builder: (controller) {
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
                      Get.to(const ArtistHome());
                    },
                    child: const Text('Painting'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const AddForAuctionPage());
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
                                      },
                                      child: const Text(
                                        'SOLD',
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

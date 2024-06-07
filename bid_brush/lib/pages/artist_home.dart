import 'package:bid_brush/pages/A_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/artist_h_controller.dart';


class ArtistHome extends StatefulWidget {
  const ArtistHome({super.key});

  @override
  State<ArtistHome> createState() => HomePageState();
}

class HomePageState extends State<ArtistHome> {
  double totalAmount = 100;
  var controller = Get.put(ArtistHController());
  @override
  Widget build(BuildContext context) {
    //init home controller

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/account.png', width: 15),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/profile.png', width: 15),
          label: account),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/img_1.png', width: 40),
          label: add)
    ];
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            title: const Text('BidBrush'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.purple,
            items: navbarItem,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
          body: controller.pagelist[controller.currentNavIndex.value]);
    });
  }
}

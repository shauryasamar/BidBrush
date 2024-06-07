import 'package:bid_brush/pages/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_h_controller.dart';


class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => HomePageState();
}

class HomePageState extends State<UserHome> {
  double totalAmount = 100;
  var controller = Get.put(UserHomeController());
  @override
  Widget build(BuildContext context) {
    //init home controller

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/account.png', width: 15),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/profile.png', width: 15),
          label: account)
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

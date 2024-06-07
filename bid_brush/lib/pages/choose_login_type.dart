import 'package:bid_brush/pages/user_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'artits_login.dart';

class ChooseLoginType extends StatelessWidget {
  const ChooseLoginType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBFB),
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: const Image(
              image: AssetImage('assets/images/2.jpg'),
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: Get.height / 20,
            right: Get.width / 3,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.purple),
                    ),
                    onPressed: () {
                      Get.to(const LoginPage());
                    },
                    child: const Text(
                      'ARTIST LOGIN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 3,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.purple),
                    ),
                    onPressed: () {
                      Get.to(const UserLogin());
                    },
                    child: const Text(
                      'USER LOGIN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

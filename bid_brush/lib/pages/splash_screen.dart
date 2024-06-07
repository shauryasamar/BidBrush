import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: const Image(
              image: AssetImage('assets/images/1.jpg'),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:bid_brush/controllers/splash_controller.dart';
import 'package:bid_brush/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBh16YWQHlaWvslWd4_Gg5D1aFmABeY_zM',
          appId: '1:286607793070:android:9b9383095b2d6339ae063f',
          messagingSenderId: '',
          projectId: 'bidbrush-7c1d7'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

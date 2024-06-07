import 'package:bid_brush/pages/choose_login_type.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(const ChooseLoginType());
    });
    super.onInit();
  }
}

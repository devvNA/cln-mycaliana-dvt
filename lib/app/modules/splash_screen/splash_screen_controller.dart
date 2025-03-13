import 'package:get/get.dart';
import 'package:mycaliana_dvt/app/routes/login_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.offAllNamed(LoginRoutes.login);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

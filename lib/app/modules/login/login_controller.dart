import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycaliana_dvt/app/routes/base_routes.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final isPasswordHidden = true.obs;
  bool? isEmailEmpty = false;
  bool? isPasswordEmpty = false;

  @override
  void onInit() {
    super.onInit();
  }

  void onLogin() {
    // Reset status error terlebih dahulu
    isEmailEmpty = false;
    isPasswordEmpty = false;

    // Cek email
    if (emailController.text.isEmpty) {
      isEmailEmpty = true;
    }

    // Cek password
    if (passwordController.text.isEmpty) {
      isPasswordEmpty = true;
    }

    // Update UI
    update();

    // Jika tidak ada error, lanjutkan proses login
    if (!isEmailEmpty! && !isPasswordEmpty!) {
      Get.offAllNamed(BaseRoutes.base);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

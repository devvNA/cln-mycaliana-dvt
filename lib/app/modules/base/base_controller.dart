import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final pageController = PageController(initialPage: 0);
  final currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}

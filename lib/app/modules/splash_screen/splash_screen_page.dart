import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycaliana_dvt/app/core/assets/assets.gen.dart';

import 'splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      builder: (context) {
        return Scaffold(
          backgroundColor: Color(0xFF00ACE6),
          body: Center(child: Image.asset(Assets.splashImage.path)),
        );
      },
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycaliana_dvt/app/core/assets/assets.gen.dart';
import 'package:mycaliana_dvt/app/core/theme/app_color.dart';
import 'package:mycaliana_dvt/app/core/widgets/custom_textform_widget.dart';
import 'package:mycaliana_dvt/app/core/widgets/spaces.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  final List<String> imageSlider = [
    Assets.picIllustration1.path,
    Assets.picIllustration2.path,
    Assets.picIllustration3.path,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4F8FF),
      body: Stack(
        children: [
          SafeArea(
            child: CarouselSlider(
              options: CarouselOptions(
                height: Get.height * 0.52,
                autoPlay: true,
                viewportFraction: 1,
              ),
              items:
                  imageSlider.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          i,
                          fit: BoxFit.cover,
                          width: Get.width,
                        );
                      },
                    );
                  }).toList(),
            ),
          ),

          Column(
            children: [
              Spacer(),
              GetBuilder<LoginController>(
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Email',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SpaceHeight(10.0),
                            CustomTextForm(
                              controller: controller.emailController,
                              hintText: 'example@caliana.id',
                              prefixIcon: const Icon(
                                Icons.alternate_email,
                                size: 16.0,
                              ),
                            ),
                            SpaceHeight(8.0),
                            Visibility(
                              visible: controller.isEmailEmpty!,
                              child: Text(
                                "Email harus diisi",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            SpaceHeight(24.0),
                            const Text(
                              'Kata Sandi',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SpaceHeight(10.0),
                            Obx(() {
                              return CustomTextForm(
                                obscureText: controller.isPasswordHidden.value,
                                controller: controller.passwordController,
                                hintText: 'Masukkan Kata Sandi Anda',
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  size: 16.0,
                                  color: Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  color: AppColors.secondary,
                                  onPressed: () {
                                    controller.isPasswordHidden.value =
                                        !controller.isPasswordHidden.value;
                                  },
                                  icon:
                                      controller.isPasswordHidden.value
                                          ? const Icon(
                                            Icons.visibility_off,
                                            size: 16,
                                          )
                                          : const Icon(
                                            Icons.visibility,
                                            size: 16,
                                          ),
                                ),
                              );
                            }),
                            SpaceHeight(8.0),
                            Visibility(
                              visible: controller.isPasswordEmpty!,
                              child: Text(
                                "Kata sandi harus diisi",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            SpaceHeight(24.0),
                            const Text(
                              'Lupa kata sandi?',
                              style: TextStyle(
                                color: AppColors.secondary,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.secondary,
                                fontSize: 16,
                              ),
                            ),
                            SpaceHeight(32.0),
                            ElevatedButton(
                              onPressed: () {
                                controller.onLogin();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              child: const Text(
                                'Masuk',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

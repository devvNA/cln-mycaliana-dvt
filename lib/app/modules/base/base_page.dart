import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:mycaliana_dvt/app/core/assets/assets.gen.dart';
import 'package:mycaliana_dvt/app/core/theme/app_color.dart';
import 'package:mycaliana_dvt/app/core/widgets/spaces.dart';
import 'package:mycaliana_dvt/app/modules/home/home_page.dart';
import 'package:mycaliana_dvt/app/modules/profile/profile_page.dart';
import 'package:mycaliana_dvt/app/routes/registration_routes.dart';

import 'base_controller.dart';

class BasePage extends GetView<BaseController> {
  BasePage({super.key});

  List<IconData> iconList = [Icons.home_outlined, Icons.person_outline_rounded];
  List<String> labelList = ["Beranda", "Profil"];
  List<Widget> listPages = [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GetBuilder<BaseController>(
          builder:
              (controller) => AppBar(
                backgroundColor: AppColors.background,
                elevation: 0,
                title: Image.asset(
                  Assets.icCaliana.path,
                  width: 80,
                  height: 80,
                ),
                actions: [
                  if (controller.currentIndex.value == 0)
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.centerLeft,
                      children: [
                        Positioned(
                          right: 32,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 2,
                              ),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 70),
                              child: const Text(
                                'Operator MyCaliana',
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFE5F8FF),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              Assets.avatar.path,
                              width: 42,
                              height: 42,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),

                  SpaceWidth(16),
                  GestureDetector(
                    onTap: () {
                      // Get.to(const NotificationPage());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(18, 0, 0, 0),
                            blurRadius: 24,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.grey,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          controller.currentIndex.value = index;
        },
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(listPages.length, (index) => listPages[index]),
      ),
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 10,
          color: Colors.white,
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changePage,
            selectedItemColor: Color(0xFF00A8E8),
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Beranda",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profil",
              ),
            ],
          ),
        );
      }),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.white,
        icon: Icons.add,
        iconTheme: IconThemeData(color: Colors.grey, size: 35),
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            foregroundColor: AppColors.primary,
            child: const Icon(Icons.contact_page_outlined),
            label: 'Pra Registrasi',
            backgroundColor: Color(0xFFE5F8FF),
            onTap: () {},
          ),
          SpeedDialChild(
            foregroundColor: AppColors.primary,
            child: const Icon(Icons.contact_page_outlined),
            label: 'Registrasi',
            backgroundColor: Color(0xFFE5F8FF),
            onTap: () {
              Get.toNamed(RegistrationRoutes.registration);
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycaliana_dvt/app/core/assets/assets.gen.dart';
import 'package:mycaliana_dvt/app/core/theme/app_color.dart';
import 'package:mycaliana_dvt/app/core/widgets/spaces.dart';
import 'package:mycaliana_dvt/app/modules/home/home_page.dart';

import 'base_controller.dart';

class BasePage extends GetView<BaseController> {
  BasePage({super.key});

  List<IconData> iconList = [Icons.home_outlined, Icons.person_outline_rounded];
  List<String> labelList = ["Beranda", "Profil"];
  List<Widget> listPages = [HomePage(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Image.asset(Assets.icCaliana.path, width: 80, height: 80),
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
                      border: Border.all(color: Colors.grey.shade300, width: 2),
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
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716044999/t3jxwmbgwelsvgsmby4c.png",
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
      body: PageView(
        onPageChanged: (index) {
          controller.currentIndex.value = index;
        },
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(listPages.length, (index) => listPages[index]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF00A8E8),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

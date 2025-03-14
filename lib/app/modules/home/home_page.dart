import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mycaliana_dvt/app/core/theme/app_color.dart';
import 'package:mycaliana_dvt/app/core/widgets/spaces.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final List<FeaturesModel> listFeatures = [
    FeaturesModel(label: 'Dasbor', icon: Icons.bar_chart_rounded),
    FeaturesModel(label: 'Daftar Pengunjung', icon: Icons.switch_account),
    FeaturesModel(label: 'Residen', icon: Icons.home_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.5;
    final double itemWidth = size.width / 1.5;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.getFormattedDate().split('\n')[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  SpaceHeight(8),
                  // Live Clock
                  Obx(() {
                    return Text(
                      DateFormat(
                        'hh:mm:ss a',
                      ).format(controller.currentTime.value),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    );
                  }),
                  SpaceHeight(24),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Cari...',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SpaceHeight(24),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fitur',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SpaceHeight(16),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Obx(() {
                          final isActive =
                              index == controller.activeTabIndex.value;
                          return GestureDetector(
                            onTap: () {
                              controller.activeTabIndex.value = index;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              height: 40,
                              decoration: BoxDecoration(
                                color:
                                    isActive
                                        ? AppColors.primary.withOpacity(0.1)
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Text(
                                  controller.listCategoryFeatures[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.copyWith(
                                    color:
                                        isActive
                                            ? AppColors.primary
                                            : Colors.grey,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                      },
                      separatorBuilder: (context, index) => SpaceWidth(16),
                      itemCount: controller.listCategoryFeatures.length,
                    ),
                  ),
                  SpaceHeight(32),
                  Obx(() {
                    List<FeaturesModel> featuresToShow = [];
                    if (controller.activeTabIndex.value == 2) {
                      featuresToShow = [listFeatures[0]];
                    } else {
                      // Tampilkan semua fitur
                      featuresToShow = listFeatures;
                    }

                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: (itemWidth / itemHeight),
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(featuresToShow.length, (index) {
                        return _buildFeatureIcon(
                          controller.activeTabIndex.value == 2
                              ? 0
                              : index, // Jika tab ketiga, selalu gunakan index 1
                          context,
                        );
                      }),
                    );
                  }),
                ],
              ),
            ),
            SpaceHeight(32),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hari Ini',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SpaceHeight(32),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Belum Ada Pengunjung Baru',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Pengunjung menunggu akan ditampilkan disini',
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.grey[700],
                          ),
                        ),
                        SpaceHeight(12),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),

                            side: const BorderSide(
                              color: AppColors.secondary,
                              width: 1.3,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Refresh",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildFeatureIcon(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(listFeatures[index].icon, color: Colors.grey[700]),
        SpaceHeight(12),
        Text(
          listFeatures[index].label,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}

class FeaturesModel {
  final String label;
  final IconData icon;

  FeaturesModel({required this.label, required this.icon});
}

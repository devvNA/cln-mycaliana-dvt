import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final visitors = [].obs;
  late Timer timer;
  final currentTime = DateTime.now().obs;
  final activeTabIndex = 0.obs;

  final List<String> listCategoryFeatures = [
    'Semua Fitur',
    'Visitor Management System',
    'Access Control System',
  ];

  void _startLiveClock() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      currentTime.value = DateTime.now();
      update();
    });
  }

  String getFormattedDate() {
    DateTime now = DateTime.now();

    String day = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(now);
    String time = DateFormat('HH:mm:ss').format(now);
    return '$day\n$time';
  }

  void refreshVisitors() {
    isLoading.value = true;
    // Simulate API call
    Future.delayed(Duration(seconds: 1), () {
      // No visitors today
      isLoading.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
    _startLiveClock();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
  }
}

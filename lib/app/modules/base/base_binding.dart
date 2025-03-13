import 'package:get/get.dart';
import 'package:mycaliana_dvt/app/modules/home/home_controller.dart';

import 'base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

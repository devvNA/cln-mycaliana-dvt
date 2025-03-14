import 'package:get/get.dart';

import 'confirm_data_controller.dart';

class ConfirmDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmDataController>(
      () => ConfirmDataController(),
    );
  }
}

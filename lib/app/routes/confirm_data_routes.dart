import 'package:get/get.dart';

import '../modules/confirm_data/confirm_data_binding.dart';
import '../modules/confirm_data/confirm_data_page.dart';

class ConfirmDataRoutes {
  ConfirmDataRoutes._();

  static const confirmData = '/confirm-data';

  static final routes = [
    GetPage(
      name: confirmData,
      page: () => const ConfirmDataPage(),
      binding: ConfirmDataBinding(),
    ),
  ];
}

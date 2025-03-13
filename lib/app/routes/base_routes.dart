import 'package:get/get.dart';

import '../modules/base/base_binding.dart';
import '../modules/base/base_page.dart';

class BaseRoutes {
  BaseRoutes._();

  static const base = '/base';

  static final routes = [
    GetPage(name: base, page: () => BasePage(), binding: BaseBinding()),
  ];
}

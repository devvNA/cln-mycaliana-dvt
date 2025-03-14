import 'package:get/get.dart';

import '../modules/registration/registration_binding.dart';
import '../modules/registration/registration_page.dart';

class RegistrationRoutes {
  RegistrationRoutes._();

  static const registration = '/registration';

  static final routes = [
    GetPage(
      name: registration,
      page: () => const RegistrationPage(),
      binding: RegistrationBinding(),
    ),
  ];
}

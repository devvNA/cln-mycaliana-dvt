import 'home_routes.dart';
import 'login_routes.dart';
import 'splash_screen_routes.dart';
import 'base_routes.dart';
import 'profile_routes.dart';
import 'registration_routes.dart';
import 'confirm_data_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/splash-screen';

  static final routes = [
    ...SplashScreenRoutes.routes,
    ...LoginRoutes.routes,
    ...HomeRoutes.routes,
		...BaseRoutes.routes,
		...ProfileRoutes.routes,
		...RegistrationRoutes.routes,
		...ConfirmDataRoutes.routes,
  ];
}

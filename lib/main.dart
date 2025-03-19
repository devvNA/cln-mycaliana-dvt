import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mycaliana_dvt/app/core/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengatur orientasi layar hanya untuk mode portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GestureDetector(
      // Menangani tap di luar keyboard untuk menutup keyboard
      onTap: () {
        FocusScopeNode currentNode = FocusScope.of(Get.context!);
        if (currentNode.focusedChild != null && !currentNode.hasPrimaryFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        popGesture: true, // Mengaktifkan gesture untuk pop navigation
        defaultTransition:
            Transition.cupertino, // Mengatur animasi transisi default
        debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
        theme: myTheme, // Mengatur tema aplikasi
        initialRoute: AppPages.INITIAL, // Mengatur rute awal
        getPages: AppPages.routes, // Mengatur daftar rute aplikasi
      ),
    );
  }
}

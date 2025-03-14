// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycaliana_dvt/app/core/theme/app_color.dart';
import 'package:mycaliana_dvt/app/core/widgets/spaces.dart';
import 'package:mycaliana_dvt/app/routes/confirm_data_routes.dart';

import 'registration_controller.dart';

class RegistrationPage extends GetView<RegistrationController> {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: SizedBox(),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Formulir Registrasi"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Data Pribadi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SpaceHeight(24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Nomor Kartu Identitas',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          SpaceWidth(4),
                          Text(
                            '(tidak wajib diisi)',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SpaceHeight(8),
                      formTitle(
                        'Masukan Nomor Kartu Identitas',
                        Icons.account_box_outlined,
                        TextInputType.number,
                        true,
                        controller.kartuIdentitasController,
                        false,
                      ),
                      SpaceHeight(16),
                      Row(
                        children: [
                          Text(
                            'Nomor Kartu Akses',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          SpaceWidth(4),
                          Text(
                            '(tidak wajib diisi)',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SpaceHeight(8),
                      formTitle(
                        'Masukan Nomor Kartu Akses',
                        Icons.account_box_outlined,
                        TextInputType.number,
                        true,
                        controller.kartuAksesController,
                        false,
                      ),
                      SpaceHeight(16),
                      Row(
                        children: [
                          Text(
                            'Nama',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '*',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SpaceHeight(8),
                      formTitle(
                        'Nama Anda',
                        Icons.person_outline_rounded,
                        TextInputType.text,
                        true,
                        controller.namaController,
                        true,
                      ),
                      SpaceHeight(16),
                      Row(
                        children: [
                          Text(
                            'Email',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '*',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SpaceHeight(8),
                      formTitle(
                        'Email Anda',
                        Icons.alternate_email,
                        TextInputType.emailAddress,
                        true,
                        controller.emailController,
                        true,
                      ),
                      SpaceHeight(32),
                      Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: Colors.grey,
                          ),
                          onPressed:
                              controller.isButtonEnabled.value
                                  ? () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      Get.toNamed(
                                        ConfirmDataRoutes.confirmData,
                                      );
                                    }
                                  }
                                  : null,
                          child: const Text("Selanjutnya"),
                        ),
                      ),
                      SpaceHeight(12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                            side: BorderSide(color: AppColors.primary),
                          ),
                        ),
                        onPressed: () {
                          Get.bottomSheet(
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Pembatalan',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ).paddingOnly(top: 16),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Semua data tidak akan disimpan. Yakin ingin membatalkan?',
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.back();
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 0.0),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Ya, batalkan",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 0.0),
                                              color: Colors.red,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Tidak, kembali",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Text("Batal"),
                      ),

                      SpaceHeight(8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField formTitle(
    String label,
    IconData prefixIcon,
    TextInputType inputType,
    bool enable,
    TextEditingController controller,
    bool isRequired,
  ) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 14),

        prefixIconColor: AppColors.primary,
        suffixIconColor: Colors.grey[400],
        fillColor: Colors.transparent,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        prefixIcon:
            prefixIcon != null
                ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
                  child: Icon(prefixIcon),
                )
                : null,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == '' && isRequired) {
          return '$label masih kosong!';
        }
        return null;
      },
    );
  }
}

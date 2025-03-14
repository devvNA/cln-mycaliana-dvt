import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycaliana_dvt/app/core/theme/app_color.dart';
import 'package:mycaliana_dvt/app/core/widgets/spaces.dart';

import 'confirm_data_controller.dart';

class ConfirmDataPage extends GetView<ConfirmDataController> {
  const ConfirmDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konfirmasi Data"), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionTile(
                title: const Text(
                  "Data Pribadi",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                collapsedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                children: [
                  _buildDataField(
                    enable: true,
                    label: "Nama",
                    icon: Icons.person_outline,
                    value: "test",
                  ),
                  const SizedBox(height: 16),
                  _buildDataField(
                    enable: true,
                    label: "Email",
                    icon: Icons.alternate_email,
                    value: "test@gmail.com",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ExpansionTile(
                title: const Text(
                  "Tujuan Kunjungan",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                collapsedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                children: [
                  _buildDataField(
                    enable: false,
                    label: "Berapa banyak orang yang bersama Anda?",
                    icon: Icons.star_border,
                    value: "1",
                  ),
                ],
              ),
              SpaceHeight(24),
              // Tombol Check In dan Batal
              // CustomButton().fillButton(context, 'Check In', () {}),
              // 8.verticalSpace,
              // CustomButton().outlineButton(context, 'Batal', () {}),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey,
                ),
                onPressed: () {
                  Get.back();
                  Get.back();
                  Get.back();
                },
                child: const Text("Check In"),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.back();
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataField({
    required String label,
    required IconData icon,
    required String value,
    required bool enable,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            readOnly: enable,
            initialValue: value,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: value,
              prefixIcon: Icon(icon),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final kartuIdentitasController = TextEditingController();
  final kartuAksesController = TextEditingController();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Tambahkan variabel observable untuk status tombol
  final isButtonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Tambahkan listener untuk memantau perubahan teks
    namaController.addListener(validateInputs);
    emailController.addListener(validateInputs);

    // Panggil validasi awal jika ada nilai default
    validateInputs();
  }

  // Fungsi untuk memvalidasi input dan mengupdate status tombol
  void validateInputs() {
    isButtonEnabled.value =
        namaController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty;
    update(); // Tambahkan update untuk memastikan UI diperbarui
  }

  // Tambahkan method untuk validasi manual
  void checkFormValidity() {
    validateInputs();
  }

  @override
  void onReady() {
    super.onReady();
    // Validasi saat halaman siap
    validateInputs();
  }

  @override
  void onClose() {
    // Hapus listener saat controller dihapus
    namaController.removeListener(validateInputs);
    emailController.removeListener(validateInputs);

    // Dispose controller
    kartuIdentitasController.dispose();
    kartuAksesController.dispose();
    namaController.dispose();
    emailController.dispose();

    super.onClose();
  }
}

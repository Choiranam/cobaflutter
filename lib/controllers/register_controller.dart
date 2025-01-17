import 'package:cobaflutter/services/register_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  final RegisterService apiServicee = RegisterService();
  var isLoading = false.obs;
  var registerStatus = ''.obs;

  Future<void> registerUser(
      String username, String password, String fullName, String email) async {
    try {
      isLoading(true);

      final responseData =
          await apiServicee.register(username, password, fullName, email);

      if (responseData['status'] == true) {
        registerStatus.value =
            'Registration successful: ${responseData['message']}';
        Get.snackbar(
          'Success',
          'Registration successful!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offNamed('/login');
      } else {
        registerStatus.value =
            'Registration failed: ${responseData['message']}';
        Get.snackbar(
          'Error',
          responseData['message'] ?? 'Registration failed.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      registerStatus.value = 'Registration failed: $e';
      Get.snackbar(
        'Exception',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}

import 'package:cobaflutter/services/login_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final storage = GetStorage();
  final LoginService apiServicee = LoginService();
  var isLoading = false.obs;
  var loginStatus = ''.obs;
  var token = ''.obs;

  Future<void> loginUser(String username, String password) async {
    try {
      isLoading(true);

      final responseData = await apiServicee.login(username, password);

      if (responseData['status'] == true) {
        token.value = responseData['token'] ?? '';
        loginStatus.value = 'Login berhasil: ${responseData['message']}\nToken: ${token.value}';
        
        await storage.write('isLoggedIn', true);
        await storage.write('token', token.value);

        Get.snackbar(
          'Success',
          'Login successfully!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed('/home');

      } else {
        loginStatus.value = 'Login failed: ${responseData['message']}';
        Get.snackbar(
          'Error',
          responseData['message'] ?? 'Login failed.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      loginStatus.value = 'Login failed: $e';
      Get.snackbar(
        'Exception',
        'An error occurred: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}

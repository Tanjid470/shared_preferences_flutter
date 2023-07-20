import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_perferces/functions/shared_prefs.dart';

import '../models/Person_model.dart';
import '../screens/Dashboard/dashboard.dart';

class AuthController extends GetxController {
  final enrollTextController = TextEditingController();
  final otpTextController = TextEditingController();

  RxBool isButton = false.obs;
  late Person loginResponse;

  //late Person loginResponse;

  dynamic login(String enroll, String otp) async {
    isButton.value = true;
    try {
      Loader();
      final response = await http.post(Uri.parse('https://reqres.in/api/users'),
          body: {"name": enroll, "job": otp});
      Get.back();

      if (response.statusCode == 201) {
        isButton.value = false;
        loginResponse = personFromJson(response.body);
        print('{Tanjid ${loginResponse.id}}');

        SharedPrefs().isLoggedIn = true;
        SharedPrefs().userId = loginResponse.id.toString();
        SharedPrefs().name=loginResponse.name.toString();
        SharedPrefs().job=loginResponse.job.toString();
        SharedPrefs().caretedAt=loginResponse.createdAt.toString();

        Get.to(() => const Dashboard());
      } else {
        isButton.value = false;
        Get.snackbar('Failed', 'Try again');
      }
    } catch (e) {
      print(e);
      // CatchDialog();
    }
  }

  Future<dynamic> Loader() {
    return showDialog(
        context: Get.context as BuildContext,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
  }
}

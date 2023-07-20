import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_perferces/controller/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              color: Colors.blue,
              size: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: authController.enrollTextController,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                label: Text('Enroll'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),gapPadding: 4.5
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: authController.otpTextController,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                label: Text('OTP'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => TextButton(
                  onPressed: authController.isButton.value
                      ? null
                      : () async {
                          authController.login(
                              authController.enrollTextController.text
                                  .toString(),
                              authController.otpTextController.text.toString());
                        },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

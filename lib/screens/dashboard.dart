import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_perferces/controller/auth_controller.dart';
import 'package:shared_perferces/functions/shared_prefs.dart';
import 'package:shared_perferces/screens/Login.dart';
import 'package:shared_perferces/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dash Board'),
        actions: [
          IconButton(
              onPressed: () async {
                // var sharedPer = await SharedPreferences.getInstance();
                // sharedPer.setBool(SplashState.KEYLOGIN, false);
                SharedPrefs().clear;
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Splash(),
                    ));
              },
              icon: const Icon(Icons.logout_sharp))
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Card(
          child: Column(
            children: [
              const Text("Successfully"),
              Text(SharedPrefs().name),
              Text(SharedPrefs().userId),
              
              Text(SharedPrefs().job),
              Text(SharedPrefs().createdAt),
              Text(SharedPrefs().isLoggedIn.toString()),

              // Text(authController.loginResponse.createdAt.toString()),
              // Text(authController.loginResponse.job.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

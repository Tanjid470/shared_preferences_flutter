import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_perferces/controller/auth_controller.dart';
import 'package:shared_perferces/functions/shared_prefs.dart';
import 'package:shared_perferces/screens/Login.dart';
import 'package:shared_perferces/screens/dashboard.dart';
import 'package:shared_perferces/screens/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}

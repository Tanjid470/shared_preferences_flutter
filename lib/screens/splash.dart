import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_perferces/functions/shared_prefs.dart';
import 'package:shared_perferces/screens/Login.dart';


import 'Dashboard/dashboard.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  static const String KEYLOGIN = 'login';
  @override
  void initState() {
    // TODO: implement initState
    whereToGO();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 254, 254),
        child: const Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(fontSize: 60),
          ),
        ),
      ),
    );
  }

  void whereToGO() async {
    // var sharedPer = await SharedPreferences.getInstance();
    // var isLoggedIn=sharedPer.getBool(KEYLOGIN);

    // SharedPrefs().isLoggedIn;

    Timer(const Duration(seconds: 1), () {
      if (SharedPrefs().isLoggedIn) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Dashboard(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
      }
      // if(isLoggedIn!= null){
      //   if(isLoggedIn){
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard(),));
      //   }
      //   else{
      //      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
      //   }
      // }
      // else{
      //   Get.to(const LoginPage());
      // }
      //Get.to(const LoginPage());
    });
  }
}

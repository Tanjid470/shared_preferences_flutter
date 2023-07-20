

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../functions/shared_prefs.dart';
import '../../splash.dart';

Logout(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              icon: const Icon(Icons.logout_sharp,size: 25,)),
             // const Text('Log out')
          ],);
  }

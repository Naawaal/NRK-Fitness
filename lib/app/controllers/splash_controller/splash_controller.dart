import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/data/services/firebase_phone_service.dart';
import 'package:nrk_fitness/app/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController {
  void isUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final firebasePhoneService = Get.put(FirebasePhoneService());
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      user.getIdToken().then((token) async {
        final userToken = token;
        firebasePhoneService.token = userToken;
        await prefs.setString('userToken', firebasePhoneService.token);
        Timer(3.seconds, () {
          Get.offNamed(RoutesName.secondSplashScreen);
        });
      });
    } else {
      // User is not signed in, go to login or signup screen
      Timer(3.seconds, () {
        Get.offNamed(RoutesName.loginOrSignupScreen);
      });
    }
  }
}

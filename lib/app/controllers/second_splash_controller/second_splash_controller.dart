import 'dart:async';

import 'package:get/get.dart';
import 'package:nrk_fitness/app/routes/routes_name.dart';

class SecondSplashController {
  void secondSplash() {
    Timer(3.seconds, () {
      Get.offNamed(RoutesName.homeScreen);
    });
  }
}

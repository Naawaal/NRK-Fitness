import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileControllerGetx extends GetxController {
  final auth = FirebaseAuth.instance;

  void signOutUser() async {
    final prefs = await SharedPreferences.getInstance();
    auth.signOut();
    // Remove data for the 'userToken' key.
    await prefs.remove('userToken');
    Get.offNamed(RoutesName.loginOrSignupScreen);
  }
}

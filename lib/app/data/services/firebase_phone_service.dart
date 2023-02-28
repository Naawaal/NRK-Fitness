import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/controllers/login_signup_controller/checkmark_controller.dart';
import 'package:nrk_fitness/app/controllers/otp_controller/otp_filed_controller.dart';
import 'package:nrk_fitness/app/routes/routes_name.dart';
import 'package:nrk_fitness/app/ui/utils/toast_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebasePhoneService extends GetxController {
  final otpFieldControllerGetx = Get.put(OtpFieldControllerGetx());
  final checkMarkController = Get.put(CheckMarkController());
  final auth = FirebaseAuth.instance;

  RxString authVerificationId = ''.obs;
  RxInt? authToken = 0.obs;

  // Obtain shared preferences.

  var token;

  void sendVerificationCode() {
    try {
      auth.verifyPhoneNumber(
        timeout: 60.seconds,
        phoneNumber:
            "+977${checkMarkController.phoneNumberController.value.text}",
        verificationCompleted: (e) {},
        verificationFailed: (e) {
          FlutterToastUtil.flutterToast(message: e.toString());
        },
        codeSent: (String verificationId, int? token) {
          authVerificationId = verificationId.obs;
          Get.toNamed(RoutesName.otpScreen);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      FlutterToastUtil.flutterToast(message: e.toString());
    }
  }

  void verifyCode() async {
    CheckMarkController checkMarkController = Get.find<CheckMarkController>();
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: authVerificationId.value,
        smsCode: otpFieldControllerGetx.otpFiled.toString(),
      );
      await auth.signInWithCredential(credential).then((value) async {
        final prefs = await SharedPreferences.getInstance();
        token = await value.user?.getIdToken();
        await prefs.setString('userToken', token);
        debugPrint("This is token =$token");
      });
      if (checkMarkController.postApiResponseStatusCode == 200 ||
          checkMarkController.postApiResponseStatusCode == 400) {
        if (checkMarkController.postApiResponseStatusCode == 200) {
          Get.toNamed(RoutesName.secondSplashScreen);
        } else if (checkMarkController.postApiResponseStatusCode == 400) {
          Get.toNamed(RoutesName.signupUserDetailScreen);
        }
      }
    } on FirebaseAuthException catch (e) {
      FlutterToastUtil.flutterToast(message: e.toString());
    }
  }
}

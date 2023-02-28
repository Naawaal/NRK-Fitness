import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/data/api/base_api.dart';
import 'package:nrk_fitness/app/data/services/firebase_phone_service.dart';
import 'package:nrk_fitness/app/ui/utils/toast_util.dart';

class CheckMarkController extends GetxController {
  RegExp phoneRegex = RegExp(r'^\d{10}$');
  RxInt phoneNumberLength = 0.obs;

  var postApiResponseStatusCode;

  final phoneNumberController = TextEditingController().obs;

  void isPhoneNumberValid() {
    if (phoneNumberController.value.text.isEmpty ||
        phoneNumberController.value.text.length != 10) {
      if (phoneNumberController.value.text.isEmpty) {
        FlutterToastUtil.flutterToast(message: 'Please enter mobile number');
      } else if (phoneNumberController.value.text.length != 10) {
        FlutterToastUtil.flutterToast(
            message: 'Please enter 10 digit mobile number');
      }
    } else {
      if (phoneRegex.hasMatch(phoneNumberController.value.text)) {
        FirebasePhoneService firebasePhoneService =
            Get.find<FirebasePhoneService>();
        firebasePhoneService.sendVerificationCode();
        BaseApi().post();
      }
    }
  }
}

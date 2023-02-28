import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/data/services/firebase_phone_service.dart';
import 'package:nrk_fitness/app/ui/global_widgets/button_widget.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';
import 'package:nrk_fitness/app/ui/theme/texts.dart';

import '../../../controllers/login_signup_controller/checkmark_controller.dart';
import '../../../controllers/otp_controller/otp_filed_controller.dart';

class LoginButtomContainer extends StatelessWidget {
  LoginButtomContainer({super.key});

  final checkMarkController = Get.put(CheckMarkController());
  final firebasePhoneService = Get.put(FirebasePhoneService());
  final otpFiledControllerGetx = Get.put(OtpFieldControllerGetx());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: checkMarkController.phoneNumberLength.value == 10 ? 103 : 135,
        color: ColorConst.primaryContainerBgColor,
        child: Column(
          children: [
            continueButton(checkMarkController, firebasePhoneService),
            const SizedBox(
              height: 15,
            ),
            textWidget(checkMarkController),
          ],
        ),
      ),
    );
  }

  Widget continueButton(final CheckMarkController checkMarkController,
      final FirebasePhoneService firebasePhoneService) {
    return Obx(
      () => ButtonWidget(
        onpressed: () {
          checkMarkController.isPhoneNumberValid();
        },
        text: TextConst.firstButtomLoginSignupText,
        textColor: checkMarkController.phoneNumberLength.value == 10
            ? ColorConst.primaryContainerBgColor
            : Colors.grey,
        buttonColor: checkMarkController.phoneNumberLength.value == 10
            ? ColorConst.secondLoginSignupButtonColor
            : ColorConst.firstLoginSignupButtonColor,
      ),
    );
  }

  Widget textWidget(final CheckMarkController checkMarkController) {
    return Obx(
      () => Text(
        checkMarkController.phoneNumberLength.value == 10
            ? ""
            : TextConst.secondButtomLoginSignupText,
        style: const TextStyle(
          color: ColorConst.secondLoginSignupButtonColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

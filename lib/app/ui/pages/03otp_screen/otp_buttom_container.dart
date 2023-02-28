import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/controllers/login_signup_controller/checkmark_controller.dart';
import 'package:nrk_fitness/app/controllers/otp_controller/otp_filed_controller.dart';
import 'package:nrk_fitness/app/data/services/firebase_phone_service.dart';
import 'package:nrk_fitness/app/ui/global_widgets/button_widget.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';
import 'package:nrk_fitness/app/ui/theme/texts.dart';

class OtpButtomContainer extends StatelessWidget {
  OtpButtomContainer({super.key});
  final otpFieldControllerGetx = Get.put(OtpFieldControllerGetx());
  final firebasePhoneService = Get.put(FirebasePhoneService());
  final checkMarkController = Get.put(CheckMarkController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: otpFieldControllerGetx.otpLength.value == 06 ? 103 : 130,
        color: ColorConst.primaryContainerBgColor,
        child: Column(
          children: [
            continueLoginButton(otpFieldControllerGetx, firebasePhoneService,
                checkMarkController),
            const SizedBox(
              height: 10,
            ),
            textWidget(otpFieldControllerGetx),
          ],
        ),
      ),
    );
  }

  Widget continueLoginButton(
      final OtpFieldControllerGetx otpFieldControllerGetx,
      final FirebasePhoneService firebasePhoneService,
      final CheckMarkController checkMarkController) {
    return Obx(
      () => ButtonWidget(
        onpressed: () {
          firebasePhoneService.verifyCode();
        },
        text: TextConst.otpContinueLogin,
        textColor: otpFieldControllerGetx.otpLength.value == 06
            ? ColorConst.primaryContainerBgColor
            : Colors.grey,
        buttonColor: otpFieldControllerGetx.otpLength.value == 06
            ? ColorConst.secondLoginSignupButtonColor
            : ColorConst.firstLoginSignupButtonColor,
      ),
    );
  }

  Widget textWidget(final OtpFieldControllerGetx otpFieldControllerGetx) {
    return Obx(
      () => Text(
        otpFieldControllerGetx.otpLength.value == 06 ? '' : TextConst.resendOtp,
        style: const TextStyle(
          color: ColorConst.secondLoginSignupButtonColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

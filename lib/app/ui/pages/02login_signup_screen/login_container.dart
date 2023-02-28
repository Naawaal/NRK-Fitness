import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/controllers/login_signup_controller/checkmark_controller.dart';
import 'package:nrk_fitness/app/ui/global_widgets/textformfiled_widget.dart';
import 'package:nrk_fitness/app/ui/pages/02login_signup_screen/login_prefix.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';
import 'package:nrk_fitness/app/ui/theme/texts.dart';

class LoginContainer extends StatelessWidget {
  LoginContainer({super.key});

  final checkMarkController = Get.put(CheckMarkController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ColorConst.primaryContainerBgColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          imageWidget(),
          textWidget(),
          const SizedBox(
            height: 16,
          ),
          phoneNumberFiled(checkMarkController),
        ],
      ),
    ).marginOnly(top: 16, left: 17, right: 17);
  }

  Widget imageWidget() {
    return Image.asset(
      'assets/png/logo.png',
      width: 126,
      height: 126,
      fit: BoxFit.contain,
    );
  }

  Widget textWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        TextConst.firstLoginSignupScreen,
        style: TextStyle(
          color: ColorConst.primaryTextBlackColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget phoneNumberFiled(final CheckMarkController checkMarkController) {
    return Obx(
      () => TextFormFiledWidget(
        hintText: 'Mobile number',
        controller: checkMarkController.phoneNumberController.value,
        onChanged: (value) {
          checkMarkController.phoneNumberLength.value = value.length;
        },
        suffixIcon: Icon(
          checkMarkController.phoneNumberLength.value == 10
              ? Icons.check_circle_sharp
              : null,
        ),
        prefixIcon: const LoginPrefix(),
      ),
    );
  }
}

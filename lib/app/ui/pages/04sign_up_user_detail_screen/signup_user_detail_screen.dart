import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/ui/pages/04sign_up_user_detail_screen/signup_buttom_container.dart';
import 'package:nrk_fitness/app/ui/pages/04sign_up_user_detail_screen/signup_image_picker.dart';
import 'package:nrk_fitness/app/ui/pages/04sign_up_user_detail_screen/singup_user_form.dart';

import 'package:nrk_fitness/app/ui/theme/colors.dart';
import 'package:nrk_fitness/app/ui/theme/texts.dart';

class SignupUserDetailScreen extends StatelessWidget {
  const SignupUserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryBgColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorConst.primaryContainerBgColor,
            borderRadius: BorderRadius.circular(08),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                firsttopText(),
                secondtopText(),
                const SizedBox(
                  height: 20,
                ),
                imagePicker(),
                const SizedBox(
                  height: 15,
                ),
                SignupUserForm(),
              ],
            ),
          ),
        ).marginOnly(left: 15, right: 15, bottom: 15, top: 15),
      ),
      bottomNavigationBar: SignupButtomContainer(),
    );
  }

  Widget firsttopText() {
    return const Text(
      TextConst.signupUserTopFirstText,
      style: TextStyle(
        color: ColorConst.primaryTextBlackColor,
        fontWeight: FontWeight.w500,
        fontSize: 26.0,
      ),
    );
  }

  Widget secondtopText() {
    return const Text(
      TextConst.signupUserTopSecondText,
      style: TextStyle(
        color: ColorConst.primaryHintStyleColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    );
  }

  Widget imagePicker() {
    return const Center(child: SignUpImagePicker());
  }
}

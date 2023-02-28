import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/controllers/signup_user_detail_controller/sign_up_create_controller.dart';
import 'package:nrk_fitness/app/ui/global_widgets/button_widget.dart';

import '../../theme/colors.dart';

class SignupButtomContainer extends StatelessWidget {
  SignupButtomContainer({super.key});
  final signupCreateController = Get.put(SignupCreateController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      color: ColorConst.primaryContainerBgColor,
      child: Column(
        children: [
          ButtonWidget(
              onpressed: () {
                signupCreateController.createUserData();
              },
              text: 'Done',
              textColor: ColorConst.primaryBgColor,
              buttonColor: ColorConst.secondLoginSignupButtonColor),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/controllers/login_signup_controller/checkmark_controller.dart';
import 'package:nrk_fitness/app/controllers/signup_user_detail_controller/sign_up_create_controller.dart';
import 'package:nrk_fitness/app/ui/global_widgets/user_form_filed.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';

class SignupUserForm extends StatelessWidget {
  SignupUserForm({super.key});

  final checkmarkController = Get.put(CheckMarkController());
  final signupCreateController = Get.put(SignupCreateController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mobile Number',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorConst.primaryHintStyleColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        mobileNumberContainer(checkmarkController),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: 'Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorConst.primaryHintStyleColor,
                  )),
              TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        userNameFiled(),
        const SizedBox(
          height: 10,
        ),
        heightWeight(),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: UserFormFiled(
                hintText: 'Height',
                suffixIcon: const Text('cm'),
                textEditingController:
                    signupCreateController.heightController.value,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: UserFormFiled(
                hintText: 'Weight',
                textEditingController:
                    signupCreateController.weightController.value,
                suffixIcon: const Text('kg'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget mobileNumberContainer(final CheckMarkController checkMarkController) {
    return Container(
      height: 55,
      width: Get.width,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: ColorConst.otpContainerUserDetaiColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "(+977) ${checkmarkController.phoneNumberController.value.text}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget userNameFiled() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 05,
        ),
        UserFormFiled(
          hintText: 'First name',
          textEditingController: signupCreateController.nameController.value,
        ),
        const SizedBox(
          height: 10,
        ),
        UserFormFiled(
          hintText: 'Middle name',
          textEditingController:
              signupCreateController.middleNameController.value,
        ),
        const SizedBox(
          height: 10,
        ),
        UserFormFiled(
          hintText: 'Last name',
          textEditingController:
              signupCreateController.lastNameController.value,
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: 'Email (for account recovery)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorConst.primaryHintStyleColor,
                  )),
              TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        UserFormFiled(
          hintText: 'Email',
          textEditingController: signupCreateController.emailController.value,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'This email will be required for account recovery.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: ColorConst.primaryHintStyleColor,
          ),
        ),
      ],
    );
  }

  Widget heightWeight() {
    return Row(
      children: const [
        Expanded(child: Text('Height')),
        Expanded(child: Text('Weight')),
      ],
    );
  }
}

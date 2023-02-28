import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/controllers/login_signup_controller/checkmark_controller.dart';
import 'package:nrk_fitness/app/controllers/signup_user_detail_controller/signup_image_picker_controller.dart';
import 'package:nrk_fitness/app/data/api/create_user_api.dart';
import 'package:nrk_fitness/app/ui/utils/toast_util.dart';

class SignupCreateController extends GetxController {
  final nameController = TextEditingController().obs;
  final middleNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final heightController = TextEditingController().obs;

  void createUserData() {
    final signupImagePickerController = Get.find<SignupImagePickerController>();
    final checkMarkController = Get.find<CheckMarkController>();
    final nameRegExp = RegExp(r'^[a-zA-Z ]+$');
    final image = signupImagePickerController.pickedImage.value;
    final String name = nameController.value.text.trim();
    final String lastName = lastNameController.value.text.trim();
    final String email = emailController.value.text.trim();
    final String weight = weightController.value.text.trim();
    final String height = heightController.value.text.trim();

    if (name.isEmpty || name.length < 6 || !nameRegExp.hasMatch(name)) {
      if (name.isEmpty) {
        FlutterToastUtil.flutterToast(message: 'Name is empty');
      } else if (name.length < 6) {
        FlutterToastUtil.flutterToast(message: 'Name lenght is less tha 6');
      } else if (!nameRegExp.hasMatch(name)) {
        FlutterToastUtil.flutterToast(
            message: 'Name contain invalid characters');
      } else {
        FlutterToastUtil.flutterToast(message: 'Something went wrong');
      }
    } else if (lastName.isEmpty) {
      FlutterToastUtil.flutterToast(message: 'Last name is empty');
    } else if (email.isEmpty || !email.isEmail) {
      if (email.isEmpty) {
        FlutterToastUtil.flutterToast(message: 'Email is empty');
      } else if (!email.isEmail) {
        FlutterToastUtil.flutterToast(message: 'Please enter valid email');
      }
    } else if (weight.isEmpty) {
      FlutterToastUtil.flutterToast(message: 'Please enter weight');
    } else if (height.isEmail) {
      FlutterToastUtil.flutterToast(message: 'Please enter height');
    } else if (!image.isImageFileName || image.isEmpty) {
      if (!image.isImageFileName) {
        FlutterToastUtil.flutterToast(message: 'Please select proper image');
      } else if (image.isEmpty) {
        FlutterToastUtil.flutterToast(message: 'Please select image');
      }
    } else {
      CreateUserApi().createUser(
        name,
        email,
        "+977${checkMarkController.phoneNumberController.value.text}",
        "+977${checkMarkController.phoneNumberController.value.text}",
      );
    }
  }
}

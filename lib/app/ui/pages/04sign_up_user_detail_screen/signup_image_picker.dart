import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/signup_user_detail_controller/signup_image_picker_controller.dart';

class SignUpImagePicker extends StatefulWidget {
  const SignUpImagePicker({super.key});

  @override
  State<SignUpImagePicker> createState() => _SignUpImagePickerState();
}

class _SignUpImagePickerState extends State<SignUpImagePicker> {
  final signupImagePickerController = Get.put(SignupImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () async {
          await signupImagePickerController.pickUserImage();
        },
        child: SizedBox(
          width: 75,
          height: 75,
          child: CircleAvatar(
            backgroundImage: const AssetImage('assets/png/image.png'),
            foregroundImage: signupImagePickerController.pickedImage.isNotEmpty
                ? FileImage(
                    File(signupImagePickerController.pickedImage.toString()))
                : null,
          ),
        ),
      ),
    );
  }
}

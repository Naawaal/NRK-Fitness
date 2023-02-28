import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nrk_fitness/app/controllers/login_signup_controller/checkmark_controller.dart';
import 'package:nrk_fitness/app/data/models/create_user_model.dart';

import '../../controllers/signup_user_detail_controller/sign_up_create_controller.dart';

class CreateUserApi {
  final checkmarkController = Get.put(CheckMarkController());
  final signupCreateController = Get.put(SignupCreateController());
  Future<CreateUserModel> createUser(
      String name, String email, String phone, String emergencyNumber) async {
    try {
      final createUserApiResponse = await http.post(
          Uri.parse("https://gym-app-server.onrender.com/api/phone/create"),
          body: {
            "name": name,
            "email": email,
            "phone": phone,
            "emergency_number": emergencyNumber
          });
      debugPrint("your status code :${createUserApiResponse.statusCode}");
      if (createUserApiResponse.statusCode == 201) {
        var jsonResponse = json.decode(createUserApiResponse.body);
        var test = jsonResponse['user'];
        var createUserModel = CreateUserModel.fromJson(test);
        debugPrint('your name is: ${createUserModel.name}');
        debugPrint('your email is: ${createUserModel.email}');
        debugPrint('your name is: ${createUserModel.phone}');
        debugPrint('your name is: ${createUserModel.emergencyNumber}');
      } else {
        var errorResponse = json.decode(createUserApiResponse.body);
        var errorMessage = errorResponse['Error'];
        debugPrint('Error creating user: $errorMessage');
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }
    return CreateUserModel(
      name: '',
      email: '',
      phone: '',
      emergencyNumber: '',
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nrk_fitness/app/controllers/login_signup_controller/checkmark_controller.dart';

import '../models/user_model.dart';

class BaseApi {
  final CheckMarkController checkMarkController =
      Get.put(CheckMarkController());
  Future<NameSearchModel> post() async {
    final postResponse = await http.post(
      Uri.parse('https://gym-app-server.onrender.com/api/phone/namesearch'),
      body: {
        "phone": "+977${checkMarkController.phoneNumberController.value.text}",
      },
    );

    checkMarkController.postApiResponseStatusCode = postResponse.statusCode;

    if (postResponse.statusCode == 200 || postResponse.statusCode == 400) {
      if (postResponse.statusCode == 200) {
        var jsonResponse = json.decode(postResponse.body);
        var test = jsonResponse['data'];
        var nameSearchModel = NameSearchModel.fromJson(test);
        debugPrint("Your name: ${nameSearchModel.name}");
        debugPrint("Your phone: ${nameSearchModel.phone}");
        debugPrint("Your id: ${nameSearchModel.id}");

        return nameSearchModel;
      } else if (postResponse.statusCode == 400) {}
    }

    return NameSearchModel(name: '', phone: 'phone');
  }
}

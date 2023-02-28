import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nrk_fitness/app/data/models/user_name_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserName {
  Future<UserNameModel> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final getUserNameResponse = await http.get(
      Uri.parse("https://gym-app-server.onrender.com/api/phone/users"),
      headers: {
        "authorization": "Bearer ${prefs.getString('userToken')}",
      },
    );

    if (getUserNameResponse.statusCode == 200) {
      var jsonResponse = json.decode(getUserNameResponse.body);
      var test = jsonResponse['data'];
      var userNameModel = UserNameModel.fromJson(test);
      prefs.setString('userName', userNameModel.name);
      return userNameModel;
    }
    return UserNameModel(
      name: '',
      email: '',
      phone: '',
      emergencyNumber: '',
      image: '',
    );
  }
}

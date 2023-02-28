import 'package:flutter/material.dart';
import 'package:nrk_fitness/app/ui/pages/02login_signup_screen/login_buttom_container.dart';
import 'package:nrk_fitness/app/ui/pages/02login_signup_screen/login_container.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryLoginSignupBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoginContainer(),
        ],
      ),
      bottomNavigationBar: LoginButtomContainer(),
    );
  }
}

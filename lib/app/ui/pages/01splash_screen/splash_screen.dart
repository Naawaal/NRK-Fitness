import 'package:flutter/material.dart';
import 'package:nrk_fitness/app/controllers/splash_controller/splash_controller.dart';
import 'package:nrk_fitness/app/ui/pages/01splash_screen/splash_logo.dart';
import 'package:nrk_fitness/app/ui/pages/01splash_screen/splash_text.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController spalshScreen = SplashController();
  @override
  void initState() {
    super.initState();
    spalshScreen.isUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryBgColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              SplashLogo(),
              SplashText(),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nrk_fitness/app/controllers/second_splash_controller/second_splash_controller.dart';
import 'package:nrk_fitness/app/ui/pages/05splash_screen/second_spalsh_image.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  void initState() {
    super.initState();
    SecondSplashController().secondSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SecondSplahImage(),
          ],
        ),
      ),
    );
  }
}

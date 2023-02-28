import 'package:flutter/widgets.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/logo.png',
      width: 275,
      height: 275,
      fit: BoxFit.contain,
    );
  }
}

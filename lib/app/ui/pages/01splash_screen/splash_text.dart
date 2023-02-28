import 'package:flutter/widgets.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';
import 'package:nrk_fitness/app/ui/theme/texts.dart';

class SplashText extends StatelessWidget {
  const SplashText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: TextConst.firstSpalshText,
            style: TextStyle(
              fontSize: 16,
              color: ColorConst.primarySplashGeryColor,
            ),
          ),
          TextSpan(
            text: TextConst.secondSplashtext,
            style: TextStyle(
              fontSize: 16,
              color: ColorConst.primarySplashRedColor,
            ),
          ),
        ],
      ),
    );
  }
}

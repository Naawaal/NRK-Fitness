import 'package:flutter/widgets.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';
import 'package:nrk_fitness/app/ui/theme/texts.dart';

class LoginPrefix extends StatelessWidget {
  const LoginPrefix({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            TextConst.firstLoginSignupTextFormFiledText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorConst.primaryTextBlackColor,
            ),
          )
        ],
      ),
    );
  }
}

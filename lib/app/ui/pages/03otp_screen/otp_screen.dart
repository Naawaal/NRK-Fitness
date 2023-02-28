import 'package:flutter/material.dart';
import 'package:nrk_fitness/app/ui/pages/03otp_screen/otp_buttom_container.dart';
import 'package:nrk_fitness/app/ui/pages/03otp_screen/otp_top_container.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryLoginSignupBgColor,
      appBar: AppBar(
        backgroundColor: ColorConst.primaryLoginSignupBgColor,
        title: const Text(
          'Back',
          style: TextStyle(
            color: ColorConst.secondLoginSignupButtonColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: ColorConst.secondLoginSignupButtonColor,
        ),
        titleSpacing: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            OtpTopContainer(),
          ],
        ),
      ),
      bottomNavigationBar: OtpButtomContainer(),
    );
  }
}

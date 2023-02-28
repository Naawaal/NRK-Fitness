import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrk_fitness/app/controllers/login_signup_controller/checkmark_controller.dart';
import 'package:nrk_fitness/app/controllers/otp_controller/otp_filed_controller.dart';
import 'package:nrk_fitness/app/data/api/base_api.dart';
import 'package:nrk_fitness/app/data/models/user_model.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';
import 'package:nrk_fitness/app/ui/theme/texts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpTopContainer extends StatefulWidget {
  const OtpTopContainer({super.key});

  @override
  State<OtpTopContainer> createState() => _OtpTopContainerState();
}

class _OtpTopContainerState extends State<OtpTopContainer> {
  final otpFiledControllerGetx = Get.put(OtpFieldControllerGetx());

  final checkMarkController = Get.put(CheckMarkController());

  late Future<NameSearchModel> nameSearchModel;

  @override
  void initState() {
    super.initState();
    nameSearchModel = BaseApi().post();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: ColorConst.primaryContainerBgColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            imageWidget(),
            textWidget(),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      avatarBuilder(),
                      const SizedBox(
                        width: 10,
                      ),
                      showUserDetail(checkMarkController),
                    ],
                  ),
                  delateBuilder(),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            otpText(),
            const SizedBox(
              height: 10,
            ),
            otpFiled(otpFiledControllerGetx),
            const SizedBox(
              height: 05,
            ),
            const Divider(
              color: ColorConst.primaryLoginSignupBgColor,
            ),
            trobleLogin(),
          ],
        ),
      ).marginOnly(top: 16, left: 17, right: 17),
    );
  }

  Widget imageWidget() {
    return Image.asset(
      'assets/png/logo.png',
      width: 126,
      height: 126,
      fit: BoxFit.contain,
    );
  }

  Widget textWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        TextConst.firstOtpTopContainerText,
        style: TextStyle(
          color: ColorConst.primaryTextBlackColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget avatarBuilder() {
    return FutureBuilder(
      future: nameSearchModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/png/man.png',
            ),
          );
        } else if (snapshot.hasError) {
          return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget showUserDetail(final CheckMarkController checkMarkController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            FutureBuilder(
              future: nameSearchModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!.name,
                    style: const TextStyle(
                        color: ColorConst.primaryTextBlackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  );
                } else if (snapshot.hasError) {
                  return const Text('');
                }

                return const Text('');
              },
            ),
            const SizedBox(
              height: 02,
            ),
            Text(
              "+977 ${checkMarkController.phoneNumberController.value.text}",
              style: const TextStyle(
                  color: Color(0xff7B7B7B),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  Widget delateBuilder() {
    return const Icon(
      Icons.delete_sharp,
      color: ColorConst.secondLoginSignupButtonColor,
    );
  }

  Widget otpText() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Enter OTP sent to above mobile number. ',
        style: TextStyle(
          color: Color(0xff7B7B7B),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget otpFiled(final OtpFieldControllerGetx otpFieldControllerGetx) {
    return OTPTextField(
      length: 6,
      width: Get.width,
      fieldWidth: 50,
      style: const TextStyle(fontSize: 16),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onChanged: (value) {
        otpFiledControllerGetx.otpLength.value = value.length;
        otpFiledControllerGetx.otpFiled = value;
      },
    );
  }

  Widget trobleLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Trouble logging in?',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorConst.secondLoginSignupButtonColor,
        ),
      ),
    );
  }
}

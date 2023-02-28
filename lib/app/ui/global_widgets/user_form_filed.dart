import 'package:flutter/material.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';

class UserFormFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController? textEditingController;
  final Widget? suffixIcon;

  const UserFormFiled({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: ColorConst.primaryLoginSignupBgColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffB5B5B5),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: suffixIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

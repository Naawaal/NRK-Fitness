import 'package:flutter/material.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';

class TextFormFiledWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextEditingController? controller;
  const TextFormFiledWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.suffixIcon,
    required this.prefixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      cursorColor: Colors.red,
      maxLines: 1,
      controller: controller,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ColorConst.primaryHintStyleColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.green,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

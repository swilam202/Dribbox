import 'package:flutter/material.dart';

import '../resources/color manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.textInputType = TextInputType.text,
    this.controller,
    this.validator,
  });

  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: ColorManager.blackColor,),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: ColorManager.blackColor,),
        ),
        labelText: labelText,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                color: ColorManager.blueColor,
              ),
        hintText: hintText,
        labelStyle: const TextStyle(
          color: ColorManager.lightDarkColor,
        ),
      ),
    );
  }
}

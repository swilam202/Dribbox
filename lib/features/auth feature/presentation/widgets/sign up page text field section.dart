import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom text form field.dart';
import '../controller/auth controller.dart';

class SignUpPageTextFieldSection extends StatelessWidget {
  const SignUpPageTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return  Column(
      children: [
        CustomTextFormField(
        labelText: 'Name',
        prefixIcon: Icons.person,
       controller: authController.signUpNameController,
        validator: (val) {
          if (val == null || val.isEmpty)
            return "Name can't be empty";
          else if (val.length < 3)
            return "Name is too short";
          else
            return null;
        },
      ),
        const SizedBox(height: 24),
        CustomTextFormField(
          textInputType: TextInputType.phone,
          labelText: 'Phone',
          prefixIcon: Icons.phone,
          controller: authController.signUpPhoneController,

          validator: (val) {
            if (val == null || val.isEmpty)
              return "Number field can't be empty";
            else if (val.length != 11)
              return "Invalid phone number";
            else
              return null;
          },
        ),
        const SizedBox(height: 24),
        CustomTextFormField(
          textInputType: TextInputType.visiblePassword,
          labelText: 'Password',
          prefixIcon: Icons.password,
          controller: authController.signUpPasswordController,
          validator: (val) {
            if (val == null || val.isEmpty)
              return "Password can't be empty";
            else if (val.length <= 6)
              return 'password is too short';
            else
              return null;
          },
          obscureText: true,
        ),],
    );
  }
}

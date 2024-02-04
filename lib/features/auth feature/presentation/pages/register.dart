import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/widgets/custom button.dart';
import '../../../../core/widgets/custom text form field.dart';
import '../controller/auth controller.dart';
import '../widgets/auth custom appbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: authCustomAppBar('Register'),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: authController.loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: authController.phoneController,
                  textInputType: TextInputType.phone,
                  labelText: 'Phone',
                  prefixIcon: Icons.phone,
                  validator: (value) {
                    if (value == null || value.length < 5) {
                      return 'Please enter a valid phone number';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 80),
                CustomButton(
                  onPressed: () async {
                    if (authController.loginKey.currentState!.validate()) {
                      await authController.registrationFunction();
                    }
                  },
                  child: Text(
                    'Register',
                    style: StyleManager.smallTextStyle(
                      color: ColorManager.whiteColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

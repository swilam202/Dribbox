import 'package:dribbox/features/auth%20feature/presentation/controller/auth%20controller.dart';
import 'package:dribbox/features/home%20feature/presentation/pages/home%20page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/services/service locator.dart';
import '../../../../core/utils/custom navigation.dart';
import '../../../../core/widgets/custom button.dart';
import '../../../../core/widgets/custom text form field.dart';
import '../widgets/auth page custom appbar.dart';
import '../widgets/switch auth section.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return  Scaffold(
      appBar: authPageCustomAppBar('Login'),
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
                  controller: authController.logInPhoneController,
                  textInputType: TextInputType.phone,
                  labelText: 'Phone',
                  prefixIcon: Icons.phone,
                ),

                const SizedBox(height: 50),
                CustomButton(
                  onPressed: () async {
                    if (authController.loginKey.currentState!.validate()) {
                      Logger().w('log: ${authController.logInPhoneController.text}');

                      await authController.registrationFunction(true);
                    }
                  },
                  child: Text(
                    'Login',
                    style: StyleManager.smallTextStyle(
                      color: ColorManager.blackColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const SwitchAuthSection(isLogin: true),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

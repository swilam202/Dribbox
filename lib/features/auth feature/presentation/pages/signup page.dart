import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/core/widgets/custom%20text%20form%20field.dart';
import 'package:dribbox/features/auth%20feature/presentation/pages/otp%20form.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/utils/custom navigation.dart';
import '../../../../core/widgets/custom button.dart';
import '../widgets/auth page custom appbar.dart';
import '../widgets/switch auth section.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey();
    return Scaffold(
      appBar: authPageCustomAppBar('Sign Up'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      labelText: 'Name',
                      prefixIcon: Icons.person,
                      validator: (val) {
                        if (val == null || val.isEmpty)
                          return 'the name field is empty please enter your name';
                        else
                          return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextFormField(
                      textInputType: TextInputType.phone,
                      labelText: 'Phone',
                      prefixIcon: Icons.phone,
                      validator: (val) {
                        if (val == null || val.length != 11)
                          return 'invalid phone number';
                        else
                          return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      labelText: 'Password',
                      prefixIcon: Icons.password,
                      validator: (val) {
                        if (val == null || val.length <= 6)
                          return 'password is too short';
                        else
                          return null;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          CustomNavigation.push(const OTPForm(phone: '+201128678924'));
                        }
                      },
                      child: Text(
                        'Sign up',
                        style: StyleManager.smallTextStyle(
                          color: ColorManager.blackColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const SwitchAuthSection(isLogin: false),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/utils/custom navigation.dart';
import '../pages/login page.dart';
import '../pages/signup page.dart';

class SwitchAuthSection extends StatelessWidget {
  const SwitchAuthSection({
    super.key,
    required this.isLogin,
  });

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLogin)
          CustomNavigation.pushReplacement(const SignupPage());
        else
          CustomNavigation.pushReplacement(const LoginPage());
      },
      child: Text.rich(

        TextSpan(
          text:
              isLogin ? 'Don’t have an account? ' : 'Already have an account? ',
          style: StyleManager.smallTextStyle(fontSize: 16),
          children: [

            TextSpan(
              text: isLogin ? 'Sign Up' : 'Login',
              style: StyleManager.smallTextStyle(
                color: ColorManager.blueColor,

                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

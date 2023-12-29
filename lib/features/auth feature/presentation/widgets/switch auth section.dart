import 'package:flutter/material.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/style manager.dart';

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
        if (isLogin) {
        }
        // CustomNavigation.authNavigation(SignupPage());
        else {}
        // CustomNavigation.authNavigation(LoginPage());
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
                color: ColorManager.lightDarkColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

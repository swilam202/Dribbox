import 'package:dribbox/features/home%20feature/presentation/pages/home%20page.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/utils/custom navigation.dart';
import '../../../../core/widgets/custom button.dart';
import '../../../../core/widgets/custom text form field.dart';
import '../widgets/auth page custom appbar.dart';
import '../widgets/switch auth section.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey();

    return  Scaffold(
      appBar: authPageCustomAppBar('Login'),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomTextFormField(
                  textInputType: TextInputType.phone,
                  labelText: 'Phone',
                  prefixIcon: Icons.phone,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  textInputType: TextInputType.visiblePassword,
                  labelText: 'Password',
                  prefixIcon: Icons.password,
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      CustomNavigation.pushReplacement(const HomePage());
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

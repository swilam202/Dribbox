import 'package:dribbox/core/utils/custom%20navigation.dart';
import 'package:dribbox/features/auth%20feature/presentation/pages/login%20page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/font weight manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/auth button.dart';
import 'signup page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(kLogo),
                ),
              ),
              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to',
                      style: StyleManager.bigTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeightManager.normalWeight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Dribbox',
                      style: StyleManager.bigTextStyle(),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'We are offering you free 1 GB of cloud storage for more storage you can buy more',
                      style: StyleManager.smallTextStyle(),
                    ),
                    const SizedBox(height: 23),
                    Text(
                      'Join for free.',
                      style: StyleManager.smallTextStyle(),
                    ),
                    const SizedBox(height: 46),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthButton(
                          icon: Icons.fingerprint,
                          text: 'Signup',
                          textColor: ColorManager.blueColor,
                          color: const Color.fromRGBO(236, 240, 252, 1.0),
                          onPressed: (){
                            CustomNavigation.push(const SignupPage());
                          },
                        ),
                        const SizedBox(width: 14),
                        AuthButton(
                          icon: Icons.arrow_forward_ios,
                          text: 'Login',
                          textColor: ColorManager.whiteColor,
                          color: ColorManager.blueColor,
                          onPressed: () {
                            CustomNavigation.push(const LoginPage());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

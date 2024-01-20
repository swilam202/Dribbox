import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/core/widgets/custom%20text%20form%20field.dart';
import 'package:dribbox/features/auth%20feature/presentation/controller/auth%20controller.dart';
import 'package:dribbox/features/auth%20feature/presentation/pages/otp%20form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/utils/custom navigation.dart';
import '../../../../core/utils/firebase exception codes.dart';
import '../../../../core/widgets/custom button.dart';
import '../../../../core/widgets/custom snack bar.dart';
import '../../../home feature/presentation/pages/home page.dart';
import '../widgets/auth page custom appbar.dart';
import '../widgets/sign up page text field section.dart';
import '../widgets/switch auth section.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
  //  final AuthController authController = AuthController();
    return Scaffold(
      appBar: authPageCustomAppBar('Sign Up'),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          physics: const BouncingScrollPhysics(),
          child: Form(
           // key: authController.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SignUpPageTextFieldSection(),
                const SizedBox(height: 30),
                CustomButton(
                  onPressed:  ()async {
                    FirebaseAuth auth = FirebaseAuth.instance;

                    await auth.verifyPhoneNumber(
                      phoneNumber: '+201550077272',
                      verificationCompleted: (PhoneAuthCredential credential) async {
                        await auth.signInWithCredential(credential);
                         CustomNavigation.pushReplacement(const HomePage());
                      },
                      verificationFailed: (FirebaseAuthException exception) {
                        customSnackBar('Alert', fireBaseExceptionCodes(exception.code));
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        print(verificationId.toString());
                        CustomNavigation.push(OTPForm(verificationId));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        customSnackBar('Warning', 'request timed out please try again!');
                      },
                      timeout: const Duration(seconds: 120),
                    );
                  },
                  child:// authController.isLoading.value ?
                 // const Center(child: CircularProgressIndicator()):
                  Text(
                    'Sign Up',
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
    );
  }
}

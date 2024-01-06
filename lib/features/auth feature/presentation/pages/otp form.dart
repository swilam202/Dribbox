import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/features/auth%20feature/presentation/widgets/auth%20page%20custom%20appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/widgets/custom button.dart';
import '../widgets/otp field.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authPageCustomAppBar('OTP'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Verification Code',
                style: StyleManager.bigTextStyle(fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: 'Enter code that we have sent to your number ',
                  children: [
                    TextSpan(
                      text: '+201128678924',
                      style: StyleManager.smallTextStyle(
                        color: ColorManager.blackColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                style: StyleManager.smallTextStyle(
                  fontSize: 16,
                  color: ColorManager.lightDarkColor,
                ),
              ),
              const SizedBox(height: 35),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OTPField(isLast: false),
                  OTPField(isLast: false),
                  OTPField(isLast: false),
                  OTPField(isLast: true),
                ],
              ),
              const SizedBox(height: 40),
              CustomButton(
                child: Text(
                  'Verify',
                  style: StyleManager.smallTextStyle(
                      color: ColorManager.whiteColor,
                  ),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+201550077272',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException exception) {
                      Logger().t(exception.toString());
                    },
                    codeSent: (String verificationId, int? resendToken) {},
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: 'Didn’t receive the code?  ',
                      children: [
                        TextSpan(
                          text: 'Resend',
                          style: StyleManager.smallTextStyle(
                            color: ColorManager.lightDarkColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    style: StyleManager.smallTextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

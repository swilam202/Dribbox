import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/widgets/custom button.dart';
import '../controller/auth controller.dart';
import '../widgets/auth custom appbar.dart';
import '../widgets/otp field.dart';

class OTPForm extends StatelessWidget {
  const OTPForm(this.verificationId, {super.key});

  final String verificationId;

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: authCustomAppBar('OTP'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: authController.otpKey,
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
                      text: '${authController.phoneController.text}',
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
                  OTPField(isLast: false),
                  OTPField(isLast: false),
                  OTPField(
                    isLast: true,
                  ),
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
                  authController.pinList.clear();

                  if (authController.otpKey.currentState!.validate()) {
                    authController.otpKey.currentState!.save();
                    String smsCode = authController.pinList.join();

                    await authController.otpFunction(verificationId, smsCode);
                  }
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: "Didn’t receive the code?  ",
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

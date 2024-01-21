import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dribbox/core/utils/firebase%20exception%20codes.dart';
import 'package:dribbox/core/widgets/custom%20snack%20bar.dart';
import 'package:dribbox/features/auth%20feature/presentation/pages/otp%20form.dart';
import 'package:dribbox/features/home%20feature/presentation/pages/home%20page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../core/utils/custom navigation.dart';
import '../../../../core/widgets/custom toast.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> key = GlobalKey();

  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController logInPhoneController = TextEditingController();
  TextEditingController logInPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  RxBool isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUpFunction() async {
    isLoading.value = true;
    await auth.verifyPhoneNumber(
      phoneNumber: '+201128678924',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
       // CustomNavigation.pushReplacement(const HomePage());
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
    isLoading.value = false;
  }

  Future<void> logInFunction() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where(logInPhoneController.text)
        .get();
    if (querySnapshot.size == 0) {
      customSnackBar('Warning', 'This phone is not found try Singing up!');
    } else {
      CustomNavigation.pushReplacement(const HomePage());
    }
  }

  Future<void> otpFunction(String verificationId,String sms) async {
    isLoading.value = true;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: sms,
    );
    var a = await auth.signInWithCredential(credential);
    print(a);
    isLoading.value = false;
  }
}

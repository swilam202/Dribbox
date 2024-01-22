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
   final GlobalKey<FormState> signupKey = GlobalKey();
   final GlobalKey<FormState> loginKey = GlobalKey();

    TextEditingController signUpNameController = TextEditingController();
    TextEditingController signUpPhoneController = TextEditingController();
    TextEditingController logInPhoneController = TextEditingController();
    TextEditingController otpController = TextEditingController();


   final FirebaseAuth auth = FirebaseAuth.instance;


    Future<void> signUpFunction() async {

    Logger().i('signUpFunction ${signUpPhoneController.text}');
    try{
      await auth.verifyPhoneNumber(
        phoneNumber: '+2${signUpPhoneController.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          CustomNavigation.pushReplacement(const HomePage());
        },
        verificationFailed: (FirebaseAuthException exception) {
          customSnackBar('Alert', fireBaseExceptionCodes(exception.code));
        },
        codeSent: (String verificationId, int? resendToken) {
          CustomNavigation.push(OTPForm(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          customSnackBar('Warning', 'Request timed out please try again!');
        },
        timeout: const Duration(seconds: 120),
      );
    }
    catch(e){
      customToast(e.toString());
    }
  }

  Future<void> logInFunction() async {
    Logger().i(logInPhoneController.text);

    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber('+2${logInPhoneController.text}');
      if(confirmationResult.verificationId != null){
        CustomNavigation.push(OTPForm(confirmationResult.verificationId));
      }

    }
    catch(e){
      customToast(e.toString());
    }
  }

  Future<void> otpFunction(String verificationId,String sms) async {
    Logger().i(sms);

    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: sms,
      );
      var a = await auth.signInWithCredential(credential);
      Logger().i(a.credential);
      Logger().i(a.user!.phoneNumber.toString());
      Logger().i(a.user!.uid.toString());
    }
    catch(e){
      customToast(e.toString());
    }
  }
}

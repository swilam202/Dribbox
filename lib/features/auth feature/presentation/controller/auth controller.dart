import 'package:dribbox/core/utils/firebase%20exception%20codes.dart';
import 'package:dribbox/core/widgets/custom%20snack%20bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../core/widgets/custom toast.dart';

class AuthController extends GetxController{
  final GlobalKey<FormState> key = GlobalKey();

TextEditingController signUpNameController = TextEditingController();
TextEditingController signUpPhoneController = TextEditingController();
TextEditingController signUpPasswordController = TextEditingController();

  RxBool isLoading = false.obs;


  Future<void> signUpFunction()async {
    isLoading.value = true;
   await FirebaseAuth.instance.verifyPhoneNumber(
     phoneNumber: '+2${signUpPhoneController.text}',
     verificationCompleted: (PhoneAuthCredential credential) {
     },
     verificationFailed: (FirebaseAuthException exception) {
        customSnackBar('Alert', fireBaseExceptionCodes(exception.code));

     },
     codeSent: (String verificationId, int? resendToken) {
       customToast('OTP have been sent to: ${signUpPhoneController.text}');
     },
     codeAutoRetrievalTimeout: (String verificationId) {
       customSnackBar('Warning', 'request timed out please try again!');
     },
   );
    isLoading.value = false;
 }

}
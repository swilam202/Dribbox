import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/storage.dart';
import '../../../../core/utils/custom navigation.dart';
import '../../../../core/utils/firebase exception codes.dart';
import '../../../../core/utils/toast status.dart';
import '../../../../core/widgets/custom snack bar.dart';
import '../../../../core/widgets/custom toast.dart';
import '../../../home feature/presentation/pages/home page.dart';
import '../pages/otp form.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> loginKey = GlobalKey();
  final GlobalKey<FormState> otpKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  List<String> pinList = [];

  Future<void> registrationFunction() async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '{phoneController.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException exception) {
          customSnackBar('Alert', firebaseExceptionCodes(exception.code));
        },
        codeSent: (String verificationId, int? resendToken) async {
          CustomNavigation.push(OTPForm(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          customSnackBar('Warning', 'Request timed out please try again!');
        },
        timeout: const Duration(seconds: 120),
      );
    } catch (e) {
      await customToast(e.toString(), ToastStatus.error);
    }
  }

  Future<void> otpFunction(String verificationId, String sms) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: sms,
      );
      await auth.signInWithCredential(credential);

      writeData('phone', '{phoneController.text}');

      await createFirestoreUser();
      CustomNavigation.pushReplacement(HomePage());
    } on FirebaseAuthException catch (e) {
      await customToast(firebaseExceptionCodes(e.code), ToastStatus.error);
    } catch (ex) {
      await customToast(ex.toString(), ToastStatus.error);
    }
  }

  Future<void> createFirestoreUser() async {
    DocumentSnapshot<Map<String, dynamic>> document = await FirebaseFirestore
        .instance
        .collection('users')
        .doc('{phoneController.text}')
        .get();

    if (!(document.exists)) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${phoneController.text}')
          .set(
        {
          'files': [],
        },
      );
    }
  }
}

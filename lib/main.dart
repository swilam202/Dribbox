import 'package:dribbox/core/resources/color%20manager.dart';
import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/utils/constants.dart';
import 'features/auth feature/presentation/pages/on boarding.dart';
import 'features/auth feature/presentation/pages/otp form.dart';
import 'features/home feature/presentation/pages/home page.dart';
import 'features/storage details/presentation/pages/storage details page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Dribbox());
}

class Dribbox extends StatelessWidget {
  const Dribbox({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const OnBoarding(),
      //home: const OTPForm(phone: '+201128678924'),
    );
  }
}

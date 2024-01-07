import 'package:dribbox/core/resources/color%20manager.dart';
import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/core/services/service%20locator.dart';
import 'package:dribbox/core/widgets/custom%20dialog.dart';
import 'package:dribbox/features/auth%20feature/presentation/pages/login%20page.dart';
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
  ServiceLocator.setup();
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
      home: PopScope(
        canPop: false,
        onPopInvoked: (val) async {
          await showCustomDialog();
        },
        child: const HomePage(),
      ),
    );
  }
}

import 'package:dribbox/core/resources/color%20manager.dart';
import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/utils/constants.dart';
import 'features/auth feature/presentation/pages/auth page.dart';
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
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.brown, scaffoldBackgroundColor: Colors.white),
      home: const AuthPage(),
    );
  }
}

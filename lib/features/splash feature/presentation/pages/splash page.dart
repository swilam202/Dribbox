import 'package:flutter/material.dart';

import '../../../../core/services/storage.dart';
import '../../../../core/utils/custom navigation.dart';
import '../../../auth feature/presentation/pages/on boarding page.dart';
import '../../../home feature/presentation/pages/home page.dart';
import '../widgets/splash body.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBody(
        animation: _animation,
      ),
    );
  }

  void initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticInOut,
    );
    _animationController.forward().then(
          (_) => Future.delayed(
            const Duration(seconds: 2),
            () async {
              String? value = await readData('phone');

              CustomNavigation.pushReplacement(
                value == null ? const OnBoardingPage() : HomePage(),
              );
            },
          ),
        );
  }
}

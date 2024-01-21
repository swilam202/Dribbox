import 'package:dribbox/core/utils/constants.dart';
import 'package:dribbox/core/utils/custom%20navigation.dart';
import 'package:flutter/material.dart';

import '../../../auth feature/presentation/pages/on boarding page.dart';
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
          (_) => Future.delayed(const Duration(seconds: 2),
              () => CustomNavigation.pushReplacement(const OnBoardingPage())),
        );
  }
}

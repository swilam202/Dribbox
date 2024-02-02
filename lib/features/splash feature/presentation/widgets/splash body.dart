import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                kCloudGif,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ScaleTransition(
            scale: animation,
            child: Text(
              'Dribbox',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

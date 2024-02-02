import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigation {
  static const Duration _duration = Duration(seconds: 1);
  static const Transition _transition = Transition.cupertinoDialog;
  static const Curve _curve = Curves.fastEaseInToSlowEaseOut;

  static void push(Widget page) {
    Get.to(page, duration: _duration, transition: _transition, curve: _curve);
  }

  static void pushReplacement(Widget page) {
    Get.offAll(page,
        duration: _duration, transition: _transition, curve: _curve);
  }

  static void pop() {
    Get.back();
  }
}

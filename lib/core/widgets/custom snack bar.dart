import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../resources/color manager.dart';
import '../utils/constants.dart';

SnackbarController customSnackBar(String title, String? message) {
  return Get.snackbar(
    title,
    message ?? '',
    backgroundColor: ColorManager.greyColor,
    icon: const Icon(
      Icons.warning,
      color: ColorManager.redColor,
    ),
    duration: kDuration,
    isDismissible: true,
    overlayBlur: 3,
    snackPosition: SnackPosition.BOTTOM,
    animationDuration: kDuration,
    forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
    margin: const EdgeInsets.all(20),
  );
}

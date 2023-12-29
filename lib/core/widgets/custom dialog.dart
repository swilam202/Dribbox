import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../resources/color manager.dart';

Future<void> showCustomDialog() async {
  await Get.defaultDialog(
    title: 'Warning',
    titleStyle: StyleManager.bigTextStyle(
        fontWeight: FontWeightManager.boldWeight,
        fontSize: 20,
        color: ColorManager.redColor),
    titlePadding: const EdgeInsets.all(16),
    middleText: 'Are you sure you want to leave the app ?',
    middleTextStyle: StyleManager.bigTextStyle(
      fontWeight: FontWeightManager.mediumWeight,
      fontSize: 16,
    ),
    backgroundColor: ColorManager.whiteColor,
    actions: [
      Expanded(
        child: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Cancel',
            style: StyleManager.smallTextStyle(
              fontWeight: FontWeightManager.mediumWeight,
              fontSize: 16,
              color: ColorManager.redColor,
            ),
          ),
        ),
      ),
      Expanded(
        child: TextButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          child: Text(
            'Yes',
            style: StyleManager.smallTextStyle(
                fontWeight: FontWeightManager.mediumWeight,
                fontSize: 16,
                color: ColorManager.blueColor),
          ),
        ),
      ),
    ],
  );
}

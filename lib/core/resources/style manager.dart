import 'package:flutter/material.dart';

import 'color manager.dart';
import 'font weight manager.dart';

class StyleManager {
  static TextStyle bigTextStyle({
    double fontSize = 38,
    Color color = ColorManager.blackColor,
    FontWeight fontWeight = FontWeightManager.boldWeight,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle smallTextStyle({
    double fontSize = 13,
    Color color = ColorManager.lightDarkColor,
    FontWeight fontWeight = FontWeightManager.mediumWeight,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }
}

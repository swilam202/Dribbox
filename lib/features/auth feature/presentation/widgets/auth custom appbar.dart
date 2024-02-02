import 'package:flutter/material.dart';

import '../../../../core/resources/style manager.dart';

PreferredSizeWidget? authCustomAppBar(String text) {
  return AppBar(
    centerTitle: true,
    title: Text(
      text,
      style: StyleManager.bigTextStyle(fontSize: 20),
    ),
    elevation: 0,
  );
}

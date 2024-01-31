import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:flutter/material.dart';


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

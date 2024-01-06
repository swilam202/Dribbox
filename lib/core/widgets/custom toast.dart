import 'package:fluttertoast/fluttertoast.dart';

import '../resources/color manager.dart';

Future<void> customToast(String msg) async {
  await Fluttertoast.showToast(
    msg: msg,
    backgroundColor: ColorManager.lightDarkColor,
    gravity: ToastGravity.BOTTOM,
  );
}

import 'package:fluttertoast/fluttertoast.dart';

import '../resources/color manager.dart';

Future<void> showToast(String msg) async {
  await Fluttertoast.showToast(
    msg: msg,
    backgroundColor: ColorManager.lightDarkColor,
    gravity: ToastGravity.BOTTOM,
  );
}

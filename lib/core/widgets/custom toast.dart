import 'package:fluttertoast/fluttertoast.dart';

import '../resources/color manager.dart';
import '../utils/toast status.dart';

Future<void> customToast(String msg, ToastStatus status) async {
  await Fluttertoast.showToast(
    msg: msg,
    backgroundColor: status == ToastStatus.success
        ? ColorManager.greenColor
        : status == ToastStatus.error
            ? ColorManager.redColor
            : ColorManager.amberColor,
    gravity: ToastGravity.BOTTOM,
  );
}

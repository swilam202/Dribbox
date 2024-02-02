import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom toast.dart';
import 'toast status.dart';

Future<void> launchFile(String url) async {
  Uri uri = Uri.parse(url);
  try {
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  } catch (e) {
    await customToast(e.toString(), ToastStatus.error);
  }
}

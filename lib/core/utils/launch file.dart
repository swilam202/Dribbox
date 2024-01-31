
import 'package:dribbox/core/utils/toast%20status.dart';
import 'package:dribbox/core/widgets/custom%20toast.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

launchFile() async {
  Uri uri = Uri.parse('https://firebasestorage.googleapis.com/v0/b/dribbox-93758.appspot.com/o/dribbox%2F%2B201550077272%2FFinal_Machine_MCQ.pdf?alt=media&token=9f4d8f59-1b6f-4e8d-aef8-87d55d24ed8a');
  try{
    await launchUrl(uri,mode: LaunchMode.platformDefault);
  }
  catch(e){
    Logger().e('************************************************************************* $e');
  }
}
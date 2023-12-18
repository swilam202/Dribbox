// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBA2-HSU6UEcZk9HEWiAxTdvWRYy0CdW88',
    appId: '1:1006275596786:web:71348372b64a08b9b31b6b',
    messagingSenderId: '1006275596786',
    projectId: 'dribbox-93758',
    authDomain: 'dribbox-93758.firebaseapp.com',
    storageBucket: 'dribbox-93758.appspot.com',
    measurementId: 'G-YNJ2583VW3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDM5d79t1uV9TNciCs4PJ69-5vFneHLv4A',
    appId: '1:1006275596786:android:052f3e02c2e5c5ecb31b6b',
    messagingSenderId: '1006275596786',
    projectId: 'dribbox-93758',
    storageBucket: 'dribbox-93758.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmy6AQslXYP4ByU_pjZyDtWTNgcfnrrkU',
    appId: '1:1006275596786:ios:df479d8e14de581fb31b6b',
    messagingSenderId: '1006275596786',
    projectId: 'dribbox-93758',
    storageBucket: 'dribbox-93758.appspot.com',
    iosBundleId: 'com.example.dribbox',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDmy6AQslXYP4ByU_pjZyDtWTNgcfnrrkU',
    appId: '1:1006275596786:ios:cf1902fcd7ec5bd7b31b6b',
    messagingSenderId: '1006275596786',
    projectId: 'dribbox-93758',
    storageBucket: 'dribbox-93758.appspot.com',
    iosBundleId: 'com.example.dribbox.RunnerTests',
  );
}

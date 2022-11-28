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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfvBpBTFg2Nl86QYLZuTMixeprmlNjMrw',
    appId: '1:128501056536:android:1ae04b398a4a9a0e72ef6d',
    messagingSenderId: '128501056536',
    projectId: 'booknooknoti',
    storageBucket: 'booknooknoti.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeS-DAAE4gUfQO1rvMJWTP0XZaPOjuZSQ',
    appId: '1:128501056536:ios:7a1eb050c81aabfb72ef6d',
    messagingSenderId: '128501056536',
    projectId: 'booknooknoti',
    storageBucket: 'booknooknoti.appspot.com',
    androidClientId: '128501056536-g1363ljvthlit8n8a90mbki1rjj5b2s3.apps.googleusercontent.com',
    iosClientId: '128501056536-effo7p6ob7db50778k8m701lbd7qhcma.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookNookAdmin',
  );
}

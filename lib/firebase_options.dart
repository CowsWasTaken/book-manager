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
    apiKey: 'AIzaSyBIA0UVW-0DtDV_Z-Ep5nfaBMID-k3WXJA',
    appId: '1:1007375638749:web:c53d630086fa4f9275bb34',
    messagingSenderId: '1007375638749',
    projectId: 'book-manager-633fe',
    authDomain: 'book-manager-633fe.firebaseapp.com',
    storageBucket: 'book-manager-633fe.appspot.com',
    measurementId: 'G-F62QZHZGSV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAdiQVE16FpFh_bP2oPGkNGLNkwx7kltc',
    appId: '1:1007375638749:android:9d9bb0aafe9cbc4e75bb34',
    messagingSenderId: '1007375638749',
    projectId: 'book-manager-633fe',
    storageBucket: 'book-manager-633fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_plf1ED0TPceNbfEvDUawdBhbT_7YdkI',
    appId: '1:1007375638749:ios:ad17f75b76f2693575bb34',
    messagingSenderId: '1007375638749',
    projectId: 'book-manager-633fe',
    storageBucket: 'book-manager-633fe.appspot.com',
    androidClientId: '1007375638749-1m8j6rpfr3tmmhoslsub0n4jn32h52di.apps.googleusercontent.com',
    iosClientId: '1007375638749-d1cb0lvcpd1674m9vqupgbtuv1bprk0e.apps.googleusercontent.com',
    iosBundleId: 'com.cowsarebeautiful.bookManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_plf1ED0TPceNbfEvDUawdBhbT_7YdkI',
    appId: '1:1007375638749:ios:4df08ff1c572882e75bb34',
    messagingSenderId: '1007375638749',
    projectId: 'book-manager-633fe',
    storageBucket: 'book-manager-633fe.appspot.com',
    androidClientId: '1007375638749-1m8j6rpfr3tmmhoslsub0n4jn32h52di.apps.googleusercontent.com',
    iosClientId: '1007375638749-ovoosgf5ch8ehgm7s4f4ghft7kbdvjun.apps.googleusercontent.com',
    iosBundleId: 'com.cowsarebeautiful.bookManager.RunnerTests',
  );
}
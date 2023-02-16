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
    apiKey: 'AIzaSyAzGarNJlYNvqk7_WweOmiVgZPrsw5jGKA',
    appId: '1:551994962017:web:1ad1369378fee899133a20',
    messagingSenderId: '551994962017',
    projectId: 'web-build-pc-362d8',
    authDomain: 'web-build-pc-362d8.firebaseapp.com',
    storageBucket: 'web-build-pc-362d8.appspot.com',
    measurementId: 'G-3LQ21KKZ15',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArlBqw2G_sKDwd4Rp-PPQw26EpTX83FXc',
    appId: '1:551994962017:android:0d2f4722f9ede6b8133a20',
    messagingSenderId: '551994962017',
    projectId: 'web-build-pc-362d8',
    storageBucket: 'web-build-pc-362d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCgmhGZk2g9LO4fPNVbv-isCbbg8XpM68',
    appId: '1:551994962017:ios:a99fb8154d6d5ebb133a20',
    messagingSenderId: '551994962017',
    projectId: 'web-build-pc-362d8',
    storageBucket: 'web-build-pc-362d8.appspot.com',
    iosClientId: '551994962017-ftrk37jo5e8lb1l233pln053rkqn4c9g.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFooter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCgmhGZk2g9LO4fPNVbv-isCbbg8XpM68',
    appId: '1:551994962017:ios:a99fb8154d6d5ebb133a20',
    messagingSenderId: '551994962017',
    projectId: 'web-build-pc-362d8',
    storageBucket: 'web-build-pc-362d8.appspot.com',
    iosClientId: '551994962017-ftrk37jo5e8lb1l233pln053rkqn4c9g.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFooter',
  );
}

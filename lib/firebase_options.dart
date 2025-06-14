// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBbnoHOvT3i4QSeBK59TKUpeKIidB78_kk',
    appId: '1:1073563434029:web:be3f6774bec77b4e3a4ca4',
    messagingSenderId: '1073563434029',
    projectId: 'cafe-pra-ja',
    authDomain: 'cafe-pra-ja.firebaseapp.com',
    storageBucket: 'cafe-pra-ja.firebasestorage.app',
    measurementId: 'G-47PMSCH1F8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFcC5drVqPQ1S_N-g8tjfz0w9ADuM0HY0',
    appId: '1:1073563434029:android:3a591b3e49b44f3c3a4ca4',
    messagingSenderId: '1073563434029',
    projectId: 'cafe-pra-ja',
    storageBucket: 'cafe-pra-ja.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqZ2NhrhunUCwr6veJo7I4KHvVDwbrPXI',
    appId: '1:1073563434029:ios:4de340bae197b5ad3a4ca4',
    messagingSenderId: '1073563434029',
    projectId: 'cafe-pra-ja',
    storageBucket: 'cafe-pra-ja.firebasestorage.app',
    iosBundleId: 'com.example.cafePraJa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqZ2NhrhunUCwr6veJo7I4KHvVDwbrPXI',
    appId: '1:1073563434029:ios:4de340bae197b5ad3a4ca4',
    messagingSenderId: '1073563434029',
    projectId: 'cafe-pra-ja',
    storageBucket: 'cafe-pra-ja.firebasestorage.app',
    iosBundleId: 'com.example.cafePraJa',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbnoHOvT3i4QSeBK59TKUpeKIidB78_kk',
    appId: '1:1073563434029:web:28789ab60a7556c13a4ca4',
    messagingSenderId: '1073563434029',
    projectId: 'cafe-pra-ja',
    authDomain: 'cafe-pra-ja.firebaseapp.com',
    storageBucket: 'cafe-pra-ja.firebasestorage.app',
    measurementId: 'G-BKLE6EGH3F',
  );
}

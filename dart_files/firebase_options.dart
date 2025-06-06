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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBWAbquD2sj1bBQ5X8TLNh9LwH4uBYER-4',
    appId: '1:245426993378:web:3b35506584bbba19dc46bb',
    messagingSenderId: '245426993378',
    projectId: 'zair-smart-pharmacy',
    authDomain: 'zair-smart-pharmacy.firebaseapp.com',
    storageBucket: 'zair-smart-pharmacy.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxqKxLr9yWy5ZGlynX6FBYqe31Ul4s160',
    appId: '1:245426993378:android:5067f577f1b17c36dc46bb',
    messagingSenderId: '245426993378',
    projectId: 'zair-smart-pharmacy',
    storageBucket: 'zair-smart-pharmacy.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBWAbquD2sj1bBQ5X8TLNh9LwH4uBYER-4',
    appId: '1:245426993378:web:66ce71542596e3b5dc46bb',
    messagingSenderId: '245426993378',
    projectId: 'zair-smart-pharmacy',
    authDomain: 'zair-smart-pharmacy.firebaseapp.com',
    storageBucket: 'zair-smart-pharmacy.firebasestorage.app',
  );
}

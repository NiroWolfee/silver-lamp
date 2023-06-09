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
    apiKey: 'AIzaSyABuM_5N-yQ6C_B4vAu2M0uffzh9kdgIrk',
    appId: '1:55561898804:web:145de0ca321fb3800f3361',
    messagingSenderId: '55561898804',
    projectId: 'gait-analysis-27553',
    authDomain: 'gait-analysis-27553.firebaseapp.com',
    storageBucket: 'gait-analysis-27553.appspot.com',
    measurementId: 'G-E8KSJYVQ8D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZLq5dKZiYqifDkirqd7WHc56o5XQRhnY',
    appId: '1:55561898804:android:bf6111b566ea363c0f3361',
    messagingSenderId: '55561898804',
    projectId: 'gait-analysis-27553',
    storageBucket: 'gait-analysis-27553.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4qW9sq15TmSs9b17zqUewJjhAlHQgpco',
    appId: '1:55561898804:ios:8f83c293224bb83c0f3361',
    messagingSenderId: '55561898804',
    projectId: 'gait-analysis-27553',
    storageBucket: 'gait-analysis-27553.appspot.com',
    iosClientId: '55561898804-3dd8hheq817icbqarlasc6epke1kncf9.apps.googleusercontent.com',
    iosBundleId: 'com.example.gaitAnalysis',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4qW9sq15TmSs9b17zqUewJjhAlHQgpco',
    appId: '1:55561898804:ios:8f83c293224bb83c0f3361',
    messagingSenderId: '55561898804',
    projectId: 'gait-analysis-27553',
    storageBucket: 'gait-analysis-27553.appspot.com',
    iosClientId: '55561898804-3dd8hheq817icbqarlasc6epke1kncf9.apps.googleusercontent.com',
    iosBundleId: 'com.example.gaitAnalysis',
  );
}

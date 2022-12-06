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
    apiKey: 'AIzaSyAKe0nNMo3tZ8bSOqMfHsoTJ2E6hD8qmRA',
    appId: '1:771622974101:web:0a70ec2e423aec8ba3e19c',
    messagingSenderId: '771622974101',
    projectId: 'expense-app-ee8a8',
    authDomain: 'expense-app-ee8a8.firebaseapp.com',
    storageBucket: 'expense-app-ee8a8.appspot.com',
    measurementId: 'G-1TTTYPDCJ5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0fXJCTKRd7k1Zw3GkZqlyXuLuX0me-oc',
    appId: '1:771622974101:android:cddd786bae83a5f6a3e19c',
    messagingSenderId: '771622974101',
    projectId: 'expense-app-ee8a8',
    storageBucket: 'expense-app-ee8a8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPXxgQDRnlZfWhDej7kyRX-hw5ZKKaC9Q',
    appId: '1:771622974101:ios:eb9dfc770dea00f6a3e19c',
    messagingSenderId: '771622974101',
    projectId: 'expense-app-ee8a8',
    storageBucket: 'expense-app-ee8a8.appspot.com',
    iosClientId: '771622974101-a40gdkcb2d4q9fr0pv1pq6enrjv134o3.apps.googleusercontent.com',
    iosBundleId: 'com.example.goodbyeMoney',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPXxgQDRnlZfWhDej7kyRX-hw5ZKKaC9Q',
    appId: '1:771622974101:ios:eb9dfc770dea00f6a3e19c',
    messagingSenderId: '771622974101',
    projectId: 'expense-app-ee8a8',
    storageBucket: 'expense-app-ee8a8.appspot.com',
    iosClientId: '771622974101-a40gdkcb2d4q9fr0pv1pq6enrjv134o3.apps.googleusercontent.com',
    iosBundleId: 'com.example.goodbyeMoney',
  );
}

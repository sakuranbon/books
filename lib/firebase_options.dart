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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmYzhhu1bJahsWnqfG78UBwh_PvytE1nE',
    appId: '1:905569187429:web:088d0b1d81dc6914ebf88c',
    messagingSenderId: '905569187429',
    projectId: 'book-30764',
    authDomain: 'book-30764.firebaseapp.com',
    storageBucket: 'book-30764.appspot.com',
    measurementId: 'G-YK5G2671Y0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqiIuhIPoHf_1N1w53aoQErtjWVTjRn7A',
    appId: '1:905569187429:android:1f52e4f6cd8df6bcebf88c',
    messagingSenderId: '905569187429',
    projectId: 'book-30764',
    storageBucket: 'book-30764.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDK0_noEc3GgAPZ9DHW75h9e3tub6yLfFc',
    appId: '1:905569187429:ios:7c8537d7dd3fbd45ebf88c',
    messagingSenderId: '905569187429',
    projectId: 'book-30764',
    storageBucket: 'book-30764.appspot.com',
    iosClientId: '905569187429-bueorbvtpft57o1pt0up3fq48lurqv9k.apps.googleusercontent.com',
    iosBundleId: 'com.example.book',
  );
}
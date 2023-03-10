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
    apiKey: 'AIzaSyAjJXJFIrYebqmyEYXThCVjWZn6ySC7SRo',
    appId: '1:992749746601:web:02945ec71cd6e59ea0ecb8',
    messagingSenderId: '992749746601',
    projectId: 'clone-ee9cb',
    authDomain: 'clone-ee9cb.firebaseapp.com',
    storageBucket: 'clone-ee9cb.appspot.com',
    measurementId: 'G-6J1ZJ12FT2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNXSpXt7XMBVlrflv-uSSIHezfx27rsWQ',
    appId: '1:992749746601:android:57ddaa9aeffe2489a0ecb8',
    messagingSenderId: '992749746601',
    projectId: 'clone-ee9cb',
    storageBucket: 'clone-ee9cb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDulfTkNYXxXpe7zEjt1T5VcJSCzajv5W0',
    appId: '1:992749746601:ios:667bca3aa5f3441ea0ecb8',
    messagingSenderId: '992749746601',
    projectId: 'clone-ee9cb',
    storageBucket: 'clone-ee9cb.appspot.com',
    iosClientId: '992749746601-m2c9be5icvnebp6fpn4rkdkrrkcjc611.apps.googleusercontent.com',
    iosBundleId: 'com.example.youtube',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDulfTkNYXxXpe7zEjt1T5VcJSCzajv5W0',
    appId: '1:992749746601:ios:667bca3aa5f3441ea0ecb8',
    messagingSenderId: '992749746601',
    projectId: 'clone-ee9cb',
    storageBucket: 'clone-ee9cb.appspot.com',
    iosClientId: '992749746601-m2c9be5icvnebp6fpn4rkdkrrkcjc611.apps.googleusercontent.com',
    iosBundleId: 'com.example.youtube',
  );
}

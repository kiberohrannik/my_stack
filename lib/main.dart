import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: String.fromEnvironment('FCM_API_KEY'),
        appId: String.fromEnvironment('FCM_APP_ID'),
        messagingSenderId: String.fromEnvironment("FCM_SENDER_ID"),
        projectId: String.fromEnvironment("FCM_PROJECT_ID"),
        storageBucket: String.fromEnvironment("FCM_BUCKET"),
      )
  );

  runApp(const MyStackApp());
}
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_stack/time_tracker/data/time_shot.dart';
import 'package:my_stack/time_tracker/data/track_status.dart';
import 'package:my_stack/time_tracker/service/hive_time_track_service.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory = await getApplicationDocumentsDirectory();

  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(TimeShotAdapter())
    ..registerAdapter(TrackStatusAdapter());

  //TODO refactor initStorage
  await HiveTimeTrackService.initStorage();

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
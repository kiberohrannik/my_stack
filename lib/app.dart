import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_stack/pages/main_page.dart';
import 'package:my_stack/push_notifications/random_foreground.dart';
import 'package:my_stack/time_tracker/time_track_facade.dart';
import 'package:push/push.dart';

import 'main.dart';

class MyStackApp extends StatefulHookWidget {
  const MyStackApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyStackAppState();
}

class _MyStackAppState extends State<MyStackApp> {
  final localNotificationPlugin = FlutterLocalNotificationsPlugin();

  late final foregroundNotificationService =
      RandomForegroundNotificationService(localNotificationsPlugin: localNotificationPlugin);


  @override
  void initState() {
    super.initState();
    _initLocalNotifications();
  }


  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final unsubscribeOnMessage = Push.instance.addOnMessage((message) {
        if (message.notification != null) {
          foregroundNotificationService.display(message.notification!);
        }
      });

      return () => unsubscribeOnMessage();
    }, []);

    return MaterialApp(
        title: 'My Stack',
        themeMode: ThemeMode.dark,
        navigatorKey: navigatorKey,
        builder: (context, child) => MainPage(title: 'My Stack', body: child!),
        initialRoute: 'homeRoute',
        routes: {'homeRoute': (context) => const TimeTrackFacade()});
  }


  Future<void> _initLocalNotifications() async {
    const AndroidInitializationSettings android =
        AndroidInitializationSettings('mipmap/ic_launcher');

    const DarwinInitializationSettings apple = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestSoundPermission: false,
        requestBadgePermission: false);

    const InitializationSettings settings =
        InitializationSettings(android: android, iOS: apple);

    await localNotificationPlugin.initialize(settings);
  }
}

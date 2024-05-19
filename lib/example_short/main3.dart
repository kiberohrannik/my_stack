import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_stack/styles/dark-theme.dart';
import 'package:push/push.dart';
import 'package:push_platform_interface/src/serialization/push_api.dart' as govno;
import 'package:http/http.dart' as http;

import 'android.dart';

void main() async {
  // Need to "ensureInitialized" before initializing `flutter_local_notifications`
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: const String.fromEnvironment('FCM_API_KEY'),
        appId: const String.fromEnvironment('FCM_APP_ID'),
        messagingSenderId: const String.fromEnvironment("FCM_SENDER_ID"),
        projectId: const String.fromEnvironment("FCM_PROJECT_ID"),
        storageBucket: const String.fromEnvironment("FCM_BUCKET"),
      )
  );

  runApp(MyApp(await initializeFlutterLocalNotifications()));
}


// Only needed for foreground notifications.
Future<FlutterLocalNotificationsPlugin> initializeFlutterLocalNotifications() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  // 'mipmap/ic_launcher' taken from https://github.com/MaikuB/flutter_local_notifications/issues/32#issuecomment-389542800
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('mipmap/ic_launcher');

  // Prevent FLN from requesting permission from the user when the app launches.
  const DarwinInitializationSettings initializationSettingsApple = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestSoundPermission: false,
      requestBadgePermission: false);

  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsApple,
      macOS: initializationSettingsApple);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  return flutterLocalNotificationsPlugin;
}

class MyApp extends HookWidget {

  const MyApp(this.flutterLocalNotificationsPlugin, {Key? key})
      : super(key: key);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  Widget build(BuildContext context) {
    final notificationWhichLaunchedApp = useState<Map<String?, Object?>?>(null);
    final messagesReceived = useState<List<RemoteMessage>>([]);
    final backgroundMessagesReceived = useState<List<RemoteMessage>>([]);
    final tappedNotificationPayloads = useState<List<Map<String?, Object?>>>([]);
    final isForegroundNotificationsEnabled = useState(true);

    useEffect(() {
      configureAndroidPushNotificationChannels();

      // Handle push notifications
      final unsubscribeOnMessage = Push.instance.addOnMessage((message) {

        // Push Notifications won't be shown by default when the app is in the foreground.
        // TODO use the state to show local notification.
        if (message.notification != null &&
            isForegroundNotificationsEnabled.value) {
          displayForegroundNotification(message.notification!);
        }
      });

      return () {
        unsubscribeOnMessage();
      };
    }, []);





    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Push Example App'),
        ),
      ),
    );
  }

  void displayForegroundNotification(govno.Notification notification) async {
    String url = "https://yt3.googleusercontent.com/_DiGCcjGwJQAZ3zmlyB8TCYuA8O9tDJ9zGNysq5sR0rxwYb6SP5fW8cb3LbfcRwfui0m27oIhA=s900-c-k-c0x00ffffff-no-rj";
    var response = (await http.get(Uri.parse(url))).bodyBytes;
    AndroidBitmap<Object> androidBitmap = ByteArrayAndroidBitmap.fromBase64String(base64Encode(response));

    final androidOptions = AndroidNotificationDetails(
        color: Colors.deepOrange,

        largeIcon: androidBitmap,
        // icon: "icon.png",
        debugChannel.id,
        debugChannel.name,
        channelDescription: debugChannel.description,
        importance: Importance.max,
        priority: Priority.high,
        ticker: "A manually-sent push notification.",
        styleInformation: const DefaultStyleInformation(
          false,
          false,
        ));

    const iosOptions = DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    final platformChannelSpecifics = NotificationDetails(android: androidOptions, iOS: iosOptions);

    await flutterLocalNotificationsPlugin
        .show(0, notification.title, notification.body, platformChannelSpecifics);
  }
}
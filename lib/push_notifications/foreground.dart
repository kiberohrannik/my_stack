import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_platform_interface/src/serialization/push_api.dart' as push;

abstract class ForegroundNotificationService {

  final FlutterLocalNotificationsPlugin localNotificationsPlugin;

  ForegroundNotificationService({required this.localNotificationsPlugin});

  void display(push.Notification notification);

}

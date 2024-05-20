import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_platform_interface/src/serialization/push_api.dart' as push;

import 'achievement_notification.dart';
import 'foreground.dart';

class RandomForegroundNotificationService extends ForegroundNotificationService {
  final Map<String, String> achievements = {
    "black_hole":"Black Hole",
    "challenger":"Challenger",
    "early_star":"Early Star",
    "far_planet":"Far Planet",
    "first_travel":"First Travel",
    "galaxy_plans":"Galaxy Plans",
    "moonlight":"Moonlight",
    "schedule_changed":"Schedule Changed",
    "time_machine":"Time Machine",
    "welcome_home":"Welcome Home",
  };

  RandomForegroundNotificationService({required super.localNotificationsPlugin});

  @override
  Future<void> display(push.Notification notification) async {
    final achievement = _getRandomAchievement();
    AndroidBitmap<Object> androidBitmap = DrawableResourceAndroidBitmap(achievement.imagePath);

    final androidOptions = AndroidNotificationDetails(
      "RandomForegroundNotification",
      "RandomForegroundNotification",
      colorized: true,
      color: Colors.deepOrange,
      importance: Importance.max,
      priority: Priority.high,
      ticker: "A manually-sent push notification.",
      styleInformation: const DefaultStyleInformation(false, false),
      largeIcon: androidBitmap,
    );

    const iosOptions = DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    final platformChannelSpecifics =
        NotificationDetails(android: androidOptions, iOS: iosOptions);

    //we mock all notification details with random achievement details
    await localNotificationsPlugin.show(
        0, achievement.title, achievement.description, platformChannelSpecifics);
  }


  AchievementNotification _getRandomAchievement() {
    final index = Random().nextInt(achievements.length);
    final key = achievements.keys.toList()[index];
    return AchievementNotification(title: achievements[key]!, imagePath: key);
  }
}

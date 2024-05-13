import 'package:flutter/material.dart';
import 'package:my_stack/pages/main_page.dart';
import 'package:my_stack/time_tracker/time_track_facade.dart';

import 'main.dart';

class MyStackApp extends StatefulWidget {
  const MyStackApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyStackAppState();
}

class _MyStackAppState extends State<MyStackApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Stack',
        themeMode: ThemeMode.dark,

        navigatorKey: navigatorKey,

        builder: (context, child) => MainPage(
            title: 'My Stack',
            body: child!
        ),

        initialRoute: 'homeRoute',
        routes: {
          'homeRoute': (context) => const TimeTrackFacade()
        });
  }
}

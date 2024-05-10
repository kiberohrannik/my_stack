import 'package:flutter/material.dart';
import 'package:my_stack/pages/main_page.dart';
import 'package:my_stack/pages/welcome_view.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class MyStackApp extends StatefulWidget {
  const MyStackApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyStackAppState();
}

class _MyStackAppState extends State<MyStackApp> {

  TimeTextController _timeTextController = TimeTextController();

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
          'homeRoute': (context) {
            return ChangeNotifierProvider(
              create: (BuildContext context) => _timeTextController,
              child: WelcomeView(_timeTextController),
            );
          }
        });
  }
}

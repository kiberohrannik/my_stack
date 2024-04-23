import 'package:flutter/material.dart';
import 'package:my_stack/pages/main_page.dart';
import 'package:my_stack/styles/styles.dart';

import 'components/base_view.dart';
import 'components/example.dart';
import 'main.dart';

class MyStackApp extends StatelessWidget {

  MyStackApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Stack',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.blueDark,
            brightness: Brightness.dark
          )
      ),
      // home: MainPage(title: 'My Stack'),

      navigatorKey: navigatorKey,
      initialRoute: 'homeRoute',
      builder: (context, child) => MainPage(title: 'My Stack', body: child!),
      routes: {
        'homeRoute': (context) => Example(),
        'newViewRoute': (context) => Example2(),
      }
    );
  }
}
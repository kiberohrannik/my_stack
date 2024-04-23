import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_stack/page/main_page.dart';
import 'package:my_stack/styles/styles.dart';

class MyStackApp extends StatelessWidget {
  const MyStackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Stack',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: DarkColor.blueDark,
            brightness: Brightness.dark
          )
      ),
      home: MainPage(title: 'My Stack'),
    );
  }
}
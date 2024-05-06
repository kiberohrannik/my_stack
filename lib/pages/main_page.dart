import 'package:flutter/material.dart';
import 'package:my_stack/components/app_bar.dart';
import 'package:my_stack/components/bottom_app_bar_menu.dart';

import '../components/bottom_app_bar.dart';
import '../styles/dark-theme.dart';

class MainPage extends StatefulWidget {
  MainPage({
    super.key,
    required this.title,
    required this.body,
  });

  final Widget body;
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: DarkGradientColor.blueGradient),

      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: MyStackAppBar(widget.title),
        bottomNavigationBar: MyStackBottomAppBar(child: BottomAppBarMenu()),

        body: widget.body
      ),
    );
  }
}

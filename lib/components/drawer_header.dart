import 'package:flutter/material.dart';

import '../main.dart';
import '../styles/dark-theme.dart';

class MyStackDrawerHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  MyStackDrawerHeader({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: DrawerHeader(
        decoration: const BoxDecoration(gradient: DarkGradientColor.homeGradient),
        child: IconButton(
          icon: const Icon(Icons.home_outlined,
              size: 50, color: DarkColor.blackBlue),
          onPressed: () {
            navigatorKey.currentState!.pushNamed('homeRoute');
            scaffoldKey.currentState!.closeDrawer();
          },
        ),
      ))
    ]);
  }
}

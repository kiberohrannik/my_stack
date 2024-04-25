import 'package:flutter/material.dart';
import 'package:my_stack/styles/styles.dart';

import '../main.dart';

class MyStackDrawerHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  MyStackDrawerHeader({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: DrawerHeader(
        decoration: const BoxDecoration(gradient: GradientColor.homeGradient),
        child: IconButton(
          icon: const Icon(Icons.home_outlined,
              size: 50, color: AppColor.blackBlue),
          onPressed: () {
            navigatorKey.currentState!.pushNamed('homeRoute');
            scaffoldKey.currentState!.closeDrawer();
          },
        ),
      ))
    ]);
  }
}

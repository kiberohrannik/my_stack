import 'package:flutter/material.dart';

class MyStackBottomAppBar extends BottomAppBar {

  const MyStackBottomAppBar({super.key, required Widget child})
      : super(
            padding: EdgeInsets.zero,
            surfaceTintColor: Colors.transparent,
            color: Colors.transparent,
            child: child);
}

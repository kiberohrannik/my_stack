import 'package:flutter/material.dart';
import 'package:my_stack/styles.dart';

class MyStackAppBar extends AppBar {

  MyStackAppBar(String title, {super.key}) : super(
    backgroundColor: AppColor.accentYellowDark,
    title: Text(title),
  );

}
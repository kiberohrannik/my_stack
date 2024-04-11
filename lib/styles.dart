import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor extends Color {

  AppColor(super.value);

  static const stYellowAccent = Color(0xFFF9A825);
}


class FlowColor extends Color {
  FlowColor(int color): super(color);
  
  static const backWhite = Color.fromARGB(255, 249, 250, 250);

  static const backYellow = Color.fromARGB(255, 250, 236, 198);
  static const accentYellow = Color.fromARGB(255, 244, 210, 123);
  // static const accentYellowDark =

  static const accentOrange = Color.fromARGB(255, 231, 112, 13);

  static const backBlue = Color.fromARGB(255, 27, 117, 208);

  static const lightGrey = Color.fromARGB(255, 186, 191, 197);
  static const darkGrey = Color.fromARGB(255, 59, 64, 69);
}
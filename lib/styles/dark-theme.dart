import 'dart:ui';

import 'package:flutter/material.dart';

class DarkColor {

  static const blueGrey = Color(0xFF263238);

  static const blackBlue = Color(0xff020712);
  static const darkestBlue = Color(0xff020712);
  static const darkBlue = Color(0xff0a1226);
  static const blue = Color(0xff1e3044);
  static const lightBlue = Color(0xff646c80);
}

class DarkGradientColor {

  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      DarkColor.blackBlue,
      DarkColor.darkestBlue,
      DarkColor.darkBlue,
      DarkColor.blue,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight
  );

  static const LinearGradient homeGradient = LinearGradient(
      colors: [
        Color(0xFF9A186D),
        Color(0xFFBC01DC),
        DarkColor.lightBlue,
        Color(0xFF00C871)
      ],

      begin: Alignment.topLeft,
      end: Alignment.bottomRight
  );

  static LinearGradient historyGradient = LinearGradient(
      colors: [
        Colors.deepOrange.shade200,
        DarkColor.blueGrey,
      ],

      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
  );
}
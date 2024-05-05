import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {

  static const blueDark = Color(0xFF001464);
  static const blueGrey = Color(0xFF263238);

  static const blackBlue = Color(0xff020421);
  static const darkestBlue = Color(0xff04093a);
  static const darkBlue = Color(0xff060f6a);
  static const blue = Color(0xff1a237e);
  static const lightBlue = Color(0xff1976d2);
}

class GradientColor {

  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      AppColor.blackBlue,
      AppColor.darkestBlue,
      AppColor.darkBlue,
      AppColor.lightBlue,
      AppColor.blueGrey
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight
  );

  static const LinearGradient homeGradient = LinearGradient(
      colors: [
        Color(0xFF9A186D),
        Color(0xFFBC01DC),
        AppColor.lightBlue,
        Color(0xFF00C871)
      ],

      begin: Alignment.topLeft,
      end: Alignment.bottomRight
  );
}
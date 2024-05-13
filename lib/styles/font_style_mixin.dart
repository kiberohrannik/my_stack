import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin FontStyleMixin {

  TextStyle textStyle({Color? color, double fontSize = 14, double? opacity}) {
    Color finalColor = color ?? Colors.deepOrange;
    if(opacity != null) {
      finalColor = finalColor.withOpacity(opacity);
    }
    return GoogleFonts.jetBrainsMono(color: finalColor, fontSize: fontSize);
  }
}
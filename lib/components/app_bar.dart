import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animated_menu_button.dart';

class MyStackAppBar extends AppBar {
  MyStackAppBar(String title, {super.key})
      : super(
            backgroundColor: Colors.transparent,
            leading: Builder(
              builder: (context) => AnimatedMenuButton()
            ),
            title: Text(title, style: GoogleFonts.jetBrainsMono(color: Colors.deepOrange)),
            // title: Text(title, style: GoogleFonts.jetBrainsMono(color: Colors.white)),
            bottom: PreferredSize(
                preferredSize: Size.zero,
                child: DottedLine(
                    lineThickness: 2,
                    dashLength: 15,
                    dashGapLength: 8,
                    // dashColor: Colors.deepOrange.shade900)
                    dashColor: Colors.deepOrange)
            )
  );
}

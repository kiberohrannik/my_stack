import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeTrackButton extends StatelessWidget {
  CustomTimerController timeController;
  String title;

  TimeTrackButton({super.key, required this.timeController, required this.title})


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 125,
      width: 125,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.purpleAccent,
        ),
      ),

      child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade200)),
          onPressed: () {
            timeController.start();

          },
          child: Text(title, style: GoogleFonts.jetBrainsMono(color: Colors.purpleAccent.shade700))
      ),
    );
  }
}
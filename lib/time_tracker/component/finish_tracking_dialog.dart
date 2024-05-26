import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stack/styles/dark-theme.dart';

import '../time_state_controller.dart';

class FinishTrackingDialog extends StatelessWidget {
  final MaterialStatesController startStyleController;
  final MaterialStatesController stopStyleController;
  final TrackTimeController trackTimeController;

  const FinishTrackingDialog({
    super.key,
    required this.startStyleController,
    required this.stopStyleController,
    required this.trackTimeController
  });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: GoogleFonts.jetBrainsMono(color: Colors.deepOrange),
      title: const Text('Finish tracking for today?'),
      backgroundColor: DarkColor.darkBlue,
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: GoogleFonts.jetBrainsMono(color: const Color(0xFF7800AE)),
          ),
          child: const Text('Yes'),
          onPressed: () {
            startStyleController.update(MaterialState.pressed, false);
            stopStyleController.update(MaterialState.pressed, true);
            trackTimeController.stop();

            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
              textStyle: GoogleFonts.jetBrainsMono(color: const Color(0xFF7800AE))
          ),
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

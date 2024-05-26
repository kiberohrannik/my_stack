import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stack/styles/dark-theme.dart';
import 'package:provider/provider.dart';

import '../time_state_controller.dart';

class FinishTrackingDialog extends StatefulWidget {
  final MaterialStatesController startStyleController;
  final MaterialStatesController stopStyleController;
  final TrackTimeController trackTimeController;

  const FinishTrackingDialog({
    super.key,
    required this.startStyleController,
    required this.stopStyleController,
    required this.trackTimeController,
  });


  @override
  State<StatefulWidget> createState() => _FinishTrackingDialogState();
}

class _FinishTrackingDialogState extends State<FinishTrackingDialog> {

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
            widget.trackTimeController.stop();
            widget.startStyleController.update(MaterialState.pressed, false);
            widget.stopStyleController.update(MaterialState.pressed, true);

            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
              textStyle: GoogleFonts.jetBrainsMono(color: const Color(0xFF7800AE))
          ),
          child: const Text('Cancel'),
          onPressed: () {
            widget.startStyleController.update(MaterialState.pressed, true);
            widget.stopStyleController.update(MaterialState.pressed, false);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

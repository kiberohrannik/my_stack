import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stack/time_tracker/time_state_controller.dart';
import 'package:provider/provider.dart';

class StartTimeTrackButton extends StatefulWidget {

  final MaterialStatesController startStyleController;
  final MaterialStatesController stopStyleController;
  final TrackTimeController trackTimeController;

  const StartTimeTrackButton({
    super.key, 
    required this.startStyleController,
    required this.stopStyleController,
    required this.trackTimeController
  });

  @override
  State<StatefulWidget> createState() => _StartTimeTrackButtonState();
  
}


class _StartTimeTrackButtonState extends State<StartTimeTrackButton> {
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(GoogleFonts.jetBrainsMono(color: Colors.purpleAccent.shade700)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if(states.contains(MaterialState.pressed)) {
              return Colors.lightGreenAccent.shade100;
            }
            return Colors.grey.shade200;
          }),
        ),
        statesController: widget.startStyleController,
        onPressed: () {
          widget.stopStyleController.update(MaterialState.pressed, false);
          widget.startStyleController.update(MaterialState.pressed, true);

          widget.trackTimeController.update();
        },
        child: Text(context.watch<TrackTimeController>().startButtonText)
    );
  }
}
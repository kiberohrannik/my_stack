import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stack/time_tracker/time_state_controller.dart';

class StopTimeTrackButton extends StatefulWidget {

  final MaterialStatesController startStyleController;
  final MaterialStatesController stopStyleController;
  final TrackTimeController trackTimeController;

  const StopTimeTrackButton({
    super.key, 
    required this.startStyleController,
    required this.stopStyleController,
    required this.trackTimeController,
  });

  @override
  State<StatefulWidget> createState() => StopTimeTrackButtonState();
  
}


class StopTimeTrackButtonState extends State<StopTimeTrackButton> {
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(GoogleFonts.jetBrainsMono(color: Colors.purpleAccent.shade700)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if(states.contains(MaterialState.pressed)) {
              return Colors.deepOrange.shade300;
            }
            return Colors.grey.shade200;
          }),
        ),
        statesController: widget.stopStyleController,
        onPressed: () {
          widget.startStyleController.update(MaterialState.pressed, false);
          widget.stopStyleController.update(MaterialState.pressed, true);

          widget.trackTimeController.stop();
        },
        child: Text("Finish", style: GoogleFonts.jetBrainsMono(color: Colors.purpleAccent.shade700))
    );
  }
}
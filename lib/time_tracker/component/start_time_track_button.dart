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
    var startFlag = !context.watch<TrackTimeController>().stopped;
    widget.startStyleController.update(MaterialState.pressed, startFlag);
    widget.stopStyleController.update(MaterialState.pressed, !startFlag);


    return ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(GoogleFonts.jetBrainsMono(color: const Color(0xFF7800AE))),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if(states.contains(MaterialState.pressed)) {
              return const Color(0xFF90FFA2);
            }
            return Colors.grey.shade200;
          }),
        ),
        statesController: widget.startStyleController,
        onPressed: () => {},
        onLongPress: () {
          widget.trackTimeController.update();
          widget.stopStyleController.update(MaterialState.pressed, !startFlag);
          widget.startStyleController.update(MaterialState.pressed, startFlag);

        },
        child: Text(context.watch<TrackTimeController>().startButtonText)
    );
  }
}
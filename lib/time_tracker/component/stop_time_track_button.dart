import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stack/time_tracker/component/finish_tracking_dialog.dart';
import 'package:my_stack/time_tracker/time_state_controller.dart';
import 'package:provider/provider.dart';

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
  State<StatefulWidget> createState() => _StopTimeTrackButtonState();
  
}


class _StopTimeTrackButtonState extends State<StopTimeTrackButton> {
  
  @override
  Widget build(BuildContext context) {
    var stopFlag = context.watch<TrackTimeController>().stopped;
    widget.startStyleController.update(MaterialState.pressed, !stopFlag);
    widget.stopStyleController.update(MaterialState.pressed, stopFlag);

    return ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(GoogleFonts.jetBrainsMono(color: const Color(0xFF7800AE))),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if(states.contains(MaterialState.pressed)) {
              return Colors.deepOrange.shade300;
            }
            return Colors.grey.shade200;
          }),
        ),
        statesController: widget.stopStyleController,
        onLongPress: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return FinishTrackingDialog(
                  startStyleController: widget.startStyleController,
                  stopStyleController: widget.stopStyleController,
                  trackTimeController: widget.trackTimeController);
            },
          );
        },
        onPressed: () => {},
        // child: const Text("Finish")
        child: Text(context.watch<TrackTimeController>().stopButtonText)
    );
  }
}
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stack/time_tracker/stop_time_track_button.dart';
import 'package:my_stack/time_tracker/time_track_button_container.dart';

import 'start_time_track_button.dart';
import 'time_state_controller.dart';

class TimeTrackView extends StatefulWidget {

  final MaterialStatesController startStatesController;
  final MaterialStatesController stopStatesController;
  final CustomTimerController timerController;
  final TrackTimeController trackTimeController;

  const TimeTrackView({
    super.key,
    required this.startStatesController,
    required this.stopStatesController,
    required this.trackTimeController,
    required this.timerController
  });

  @override
  State<StatefulWidget> createState() => _TimeTrackViewState();
}


class _TimeTrackViewState extends State<TimeTrackView> {

  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  child: CustomTimer(
                      controller: widget.timerController,
                      builder: (state, time) {
                        return Text(
                            "${time.hours}:${time.minutes}:${time.seconds}",
                            style: GoogleFonts.jetBrainsMono(
                                color: Colors.deepOrange, fontSize: 40));
                      })),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimeTrackButtonContainer(
                      button: StartTimeTrackButton(
                          startStyleController: widget.startStatesController,
                          stopStyleController: widget.stopStatesController,
                          trackTimeController: widget.trackTimeController)
                  ),
                  TimeTrackButtonContainer(
                      button: StopTimeTrackButton(
                          startStyleController: widget.startStatesController,
                          stopStyleController: widget.stopStatesController,
                          trackTimeController: widget.trackTimeController)
                  )
                ],
              ),


              const Spacer(flex: 1),

              Flexible(
                  flex: 2,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                    child: ListView(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          padding: EdgeInsets.zero,
                          margin: const EdgeInsets.only(bottom: 3),
                          child: ListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            title: Text("Yesterday 07:44",
                                style: GoogleFonts.jetBrainsMono(
                                    color: Colors.deepOrange)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          margin: const EdgeInsets.only(bottom: 3),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            title: Text("26 April 07:44",
                                style: GoogleFonts.jetBrainsMono(
                                    color: Colors.deepOrange)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          margin: const EdgeInsets.only(bottom: 3),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            title: Text("25 April 07:44",
                                style: GoogleFonts.jetBrainsMono(
                                    color: Colors.deepOrange)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          margin: const EdgeInsets.only(bottom: 3),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            title: Text("24 April 07:44",
                                style: GoogleFonts.jetBrainsMono(
                                    color: Colors.deepOrange.withOpacity(0.7))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          margin: const EdgeInsets.only(bottom: 3),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            title: Text("23 April 07:44",
                                style: GoogleFonts.jetBrainsMono(
                                    color: Colors.deepOrange.withOpacity(0.4))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          margin: const EdgeInsets.only(bottom: 3),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
                            title: Text("22 April 07:44",
                                style: GoogleFonts.jetBrainsMono(
                                    color:
                                        Colors.deepOrange.withOpacity(0.15))),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        );
  }
}

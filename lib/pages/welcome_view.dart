import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stack/time_tracker/stop_time_track_button.dart';
import 'package:my_stack/time_tracker/time_track_button_container.dart';
import 'package:provider/provider.dart';

import '../time_tracker/start_time_track_button.dart';
import '../time_tracker/time_state_controller.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<StatefulWidget> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>
    with SingleTickerProviderStateMixin {
  final MaterialStatesController _startStatesController =
      MaterialStatesController();
  final MaterialStatesController _stopStatesController =
      MaterialStatesController();

  late final CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin: const Duration(),
      end: const Duration(hours: 24),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds);

  late final TrackTimeController _trackTimeController =
      TrackTimeController(_controller);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _trackTimeController,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  child: CustomTimer(
                      controller: _controller,
                      builder: (state, time) {
                        // Build the widget you want!🎉
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
                          startStyleController: _startStatesController,
                          stopStyleController: _stopStatesController,
                          trackTimeController: _trackTimeController)),
                  TimeTrackButtonContainer(
                      button: StopTimeTrackButton(
                          startStyleController: _startStatesController,
                          stopStyleController: _stopStatesController,
                          trackTimeController: _trackTimeController))
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
        ));
  }
}

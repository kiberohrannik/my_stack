import 'dart:ffi';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomeView extends StatefulWidget {

  TimeTextController _timeTextController;

  WelcomeView(this._timeTextController, {super.key});

  @override
  State<StatefulWidget> createState() => _WelcomeViewState();
}

class TimeTextController extends ChangeNotifier {
  String startButtonText = "Start";
  bool _stopped = true;

  update(CustomTimerController timerController) {
    if(_stopped) {
      timerController.reset();
      timerController.start();
      _stopped = false;

    } else if(startButtonText == "Start" || startButtonText == "Resume") {
      startButtonText = "Pause";
      timerController.pause();

    } else if(startButtonText == "Pause") {
      startButtonText = "Resume";
      timerController.start();
    }

    notifyListeners();
  }

  stop(CustomTimerController timerController) {
    startButtonText = "Start";
    notifyListeners();
    timerController.pause();
    _stopped = true;
  }
}

class _WelcomeViewState extends State<WelcomeView> with SingleTickerProviderStateMixin {

  late CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin: Duration(),
      end: Duration(hours: 24),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds
  );

  MaterialStatesController _startStatesController = MaterialStatesController();
  MaterialStatesController _stopStatesController = MaterialStatesController();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
      child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),

                  child: CustomTimer(
                      controller: _controller,
                      builder: (state, time) {
                        // Build the widget you want!🎉
                        return Text(
                            "${time.hours}:${time.minutes}:${time.seconds}",
                            style: GoogleFonts.jetBrainsMono(color: Colors.deepOrange, fontSize: 40)
                        );
                      }
                  )

                  // child: Text(
                  //     "displayTime",
                  //     style: GoogleFonts.jetBrainsMono(color: Colors.deepOrange, fontSize: 40)),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      margin: EdgeInsets.all(15),
                      height: 125,
                      width: 125,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.purpleAccent,
                        ),
                        // borderRadius: BorderRadius.all(Radius.circular(40))
                      ),

                      child: ElevatedButton(
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(GoogleFonts.jetBrainsMono(color: Colors.purpleAccent.shade700)),
                            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                              if(states.contains(MaterialState.pressed)) {
                                return Colors.lightGreenAccent.shade100;
                              }
                              return Colors.grey.shade200;
                            }),
                          ),
                          statesController: _startStatesController,
                          onPressed: () {
                            _stopStatesController.update(MaterialState.pressed, false);
                            _startStatesController.update(MaterialState.pressed, true);
                            // _controller.start();

                            widget._timeTextController.update(_controller);
                          },
                          child: Text(context.watch<TimeTextController>().startButtonText)
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(15),
                      height: 125,
                      width: 125,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.purpleAccent,
                        ),
                        // borderRadius: BorderRadius.all(Radius.circular(40))
                      ),

                      child: ElevatedButton(
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(GoogleFonts.jetBrainsMono(color: Colors.purpleAccent.shade700)),
                            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                              if(states.contains(MaterialState.pressed)) {
                                return Colors.deepOrange.shade300;
                              }
                              return Colors.grey.shade200;
                            }),
                          ),
                          statesController: _stopStatesController,
                          onPressed: () {
                            _startStatesController.update(MaterialState.pressed, false);
                            _stopStatesController.update(MaterialState.pressed, true);
                            // _controller.pause();
                            widget._timeTextController.stop(_controller);
                          },
                          child: Text("Finish", style: GoogleFonts.jetBrainsMono(color: Colors.purpleAccent.shade700))
                      ),
                    )
                  ],
                ),

                Spacer(flex: 1),

                Flexible(
                    flex: 2,
                    child: Container (
                      padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                      child: ListView(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.only(bottom: 3),
                            child: ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              title: Text("Yesterday 07:44", style: GoogleFonts.jetBrainsMono(color: Colors.deepOrange)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.only(bottom: 3),
                            child: ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              title: Text("26 April 07:44", style: GoogleFonts.jetBrainsMono(color: Colors.deepOrange)),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.only(bottom: 3),
                            child: ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              title: Text("25 April 07:44", style: GoogleFonts.jetBrainsMono(color: Colors.deepOrange)),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.only(bottom: 3),
                            child: ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              title: Text("24 April 07:44", style: GoogleFonts.jetBrainsMono(color: Colors.deepOrange.withOpacity(0.7))),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.only(bottom: 3),
                            child: ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              title: Text("23 April 07:44", style: GoogleFonts.jetBrainsMono(color: Colors.deepOrange.withOpacity(0.4))),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.only(bottom: 3),
                            child: ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                              title: Text("22 April 07:44", style: GoogleFonts.jetBrainsMono(color: Colors.deepOrange.withOpacity(0.15))),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                        ],
                      ),
                    )
                )



              ],
            ),
    );
  }
}
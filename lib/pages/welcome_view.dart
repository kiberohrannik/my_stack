import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> with SingleTickerProviderStateMixin {

  late CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin: Duration(),
      end: Duration(hours: 24),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds
  );

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
                      height: 120,
                      width: 120,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.purpleAccent,
                        ),
                        // borderRadius: BorderRadius.all(Radius.circular(40))
                      ),

                      child: ElevatedButton(
                          onPressed: () {
                            _controller.start();

                          },
                          child: Text("Start")
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(15),
                      height: 120,
                      width: 120,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.purpleAccent,
                        ),
                        // borderRadius: BorderRadius.all(Radius.circular(40))
                      ),

                      child: ElevatedButton(
                          onPressed: () {
                            _controller.pause();



                          },
                          child: Text("Stop")
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
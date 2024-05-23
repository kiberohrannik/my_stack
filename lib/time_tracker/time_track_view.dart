import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:my_stack/styles/dark-theme.dart';
import 'package:my_stack/styles/font_style_mixin.dart';
import 'package:my_stack/time_tracker/service/history_service.dart';
import 'package:my_stack/time_tracker/stop_time_track_button.dart';
import 'package:my_stack/time_tracker/time_track_button_container.dart';
import 'package:my_stack/time_tracker/timer.dart';
import 'package:my_stack/time_tracker/track_time_history_item.dart';

import 'start_time_track_button.dart';
import 'time_state_controller.dart';

class TimeTrackView extends StatefulWidget {
  final MaterialStatesController startStatesController;
  final MaterialStatesController stopStatesController;
  final CustomTimerController timerController;
  final TrackTimeController trackTimeController;
  final TimeHistoryService historyService;

  const TimeTrackView(
      {super.key,
      required this.startStatesController,
      required this.stopStatesController,
      required this.trackTimeController,
      required this.timerController,
      required this.historyService});

  @override
  State<StatefulWidget> createState() => _TimeTrackViewState();
}

class _TimeTrackViewState extends State<TimeTrackView> with FontStyleMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(

        children: [
          Container(
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              child: StackTimer(timerController: widget.timerController)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeTrackButtonContainer(
                  button: StartTimeTrackButton(
                      startStyleController: widget.startStatesController,
                      stopStyleController: widget.stopStatesController,
                      trackTimeController: widget.trackTimeController)),
              TimeTrackButtonContainer(
                  button: StopTimeTrackButton(
                      startStyleController: widget.startStatesController,
                      stopStyleController: widget.stopStatesController,
                      trackTimeController: widget.trackTimeController))
            ],
          ),

          const Spacer(flex: 1),

          Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),

                child: ShaderMask(
                  shaderCallback: (bounds) =>
                      DarkGradientColor.historyGradient.createShader(bounds),

                  child: ListView.builder(
                      itemCount: widget.historyService.getAll().length,
                      itemBuilder: (context, index) {
                        return TrackTimeHistoryItem(
                            text: widget.historyService.getAll()[index]);
                      }),
                ),
              ))
        ],
      ),
    );
  }
}

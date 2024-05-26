import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:my_stack/styles/dark-theme.dart';
import 'package:my_stack/styles/font_style_mixin.dart';
import 'package:my_stack/time_tracker/service/history_service.dart';
import 'package:my_stack/time_tracker/component/stop_time_track_button.dart';
import 'package:my_stack/time_tracker/component/time_track_button_container.dart';
import 'package:my_stack/time_tracker/component/timer.dart';
import 'package:my_stack/time_tracker/component/track_time_history_item.dart';

import 'component/start_time_track_button.dart';
import 'time_state_controller.dart';

class TimeTrackView extends StatefulWidget {
  final MaterialStatesController _startStatesController = MaterialStatesController();
  final MaterialStatesController _stopStatesController = MaterialStatesController();
  final CustomTimerController timerController;
  final TrackTimeController trackTimeController;
  final TimeHistoryService historyService;

  TimeTrackView(
      {super.key,
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
                      startStyleController: widget._startStatesController,
                      stopStyleController: widget._stopStatesController,
                      trackTimeController: widget.trackTimeController)),
              TimeTrackButtonContainer(
                  button: StopTimeTrackButton(
                      startStyleController: widget._startStatesController,
                      stopStyleController: widget._stopStatesController,
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

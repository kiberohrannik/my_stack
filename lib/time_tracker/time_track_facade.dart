import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:my_stack/time_tracker/time_track_view.dart';
import 'package:provider/provider.dart';

import 'time_state_controller.dart';

class TimeTrackFacade extends StatefulWidget {
  
  const TimeTrackFacade({super.key});
  
  @override
  State<StatefulWidget> createState() => TimeTrackFacadeState();
  
}

class TimeTrackFacadeState extends State<TimeTrackFacade> with SingleTickerProviderStateMixin {

  final MaterialStatesController _startStatesController = MaterialStatesController();
  final MaterialStatesController _stopStatesController = MaterialStatesController();

  late final CustomTimerController _timerController = CustomTimerController(
      vsync: this,
      begin: const Duration(),
      end: const Duration(hours: 24),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds);

  late final TrackTimeController _trackTimeController = TrackTimeController(_timerController);
  
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _trackTimeController,
        
        child: TimeTrackView(
          startStatesController: _startStatesController,
          stopStatesController: _stopStatesController,
          timerController: _timerController,
          trackTimeController: _trackTimeController,
        )
    );
  }
}

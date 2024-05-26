import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_stack/time_tracker/data/time_shot.dart';
import 'package:my_stack/time_tracker/data/track_status.dart';
import 'package:my_stack/time_tracker/service/history_service.dart';
import 'package:my_stack/time_tracker/service/hive_time_track_service.dart';
import 'package:my_stack/time_tracker/time_track_view.dart';
import 'package:provider/provider.dart';

import 'time_state_controller.dart';

class TimeTrackFacade extends StatefulWidget {
  
  const TimeTrackFacade({super.key});
  
  @override
  State<StatefulWidget> createState() => _TimeTrackFacadeState();
  
}

class _TimeTrackFacadeState extends State<TimeTrackFacade> with SingleTickerProviderStateMixin, RestorationMixin {

  final MaterialStatesController _startStatesController = MaterialStatesController();
  final MaterialStatesController _stopStatesController = MaterialStatesController();

  late final CustomTimerController _timerController = CustomTimerController(
      vsync: this,
      begin: const Duration(),
      end: const Duration(hours: 24),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds);

  final HiveTimeTrackService timeTrackService = HiveTimeTrackService();

  // RestorableInt<TimeShot> trackedTime = RestorableInt(0);
  late final TrackTimeController _trackTimeController = TrackTimeController(_timerController, timeTrackService);

  final TimeHistoryService _historyService = new InMemoryTimeHistoryService();
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _trackTimeController,
        
        child: TimeTrackView(
          startStatesController: _startStatesController,
          stopStatesController: _stopStatesController,
          timerController: _timerController,
          trackTimeController: _trackTimeController,
          historyService: _historyService,
        )
    );
  }


  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(

      onDetach: () {
        timeTrackService.saveTime(
            trackedSeconds: _timerController.remaining.value.duration.inSeconds,
            trackStatus: TrackStatus.FINISHED
        );
      },
    );
  }

  @override
  String? get restorationId => "track-time-restorationId";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // registerForRestoration(, restorationId)
  }


}

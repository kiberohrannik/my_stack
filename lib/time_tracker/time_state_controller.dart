import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_stack/time_tracker/data/track_status.dart';
import 'package:my_stack/time_tracker/service/hive_time_track_service.dart';
import 'package:my_stack/time_tracker/service/time_track_service.dart';

class TrackTimeController extends ChangeNotifier {

  final HiveTimeTrackService _timeTrackService;
  final CustomTimerController _timerController;

  bool _stopped = true;
  // late String startButtonText;
  late String startButtonText = TrackStatus.STOPPED.buttonText;


  TrackTimeController(this._timerController, this._timeTrackService) {

    _timerController.state.addListener(() {
      TrackStatus trackStatus = TrackStatus.getStatus(_timerController.state.value);
      startButtonText = trackStatus.buttonText;
      notifyListeners();

      _timeTrackService.saveTime(
          trackedSeconds: _timerController.remaining.value.duration.inSeconds,
          trackStatus: trackStatus
      );
    });


    _timerController.begin = _timeTrackService.getTrackedTime();

    if(_timeTrackService.getStatus() == TrackStatus.RUNNING) {
      print("bgtenbgtebngt-----------------");
      //FIXME Here is the problem
      _timerController.remaining.value = CustomTimerRemainingTime(duration: _timerController.begin);
      _timerController.start();
      _stopped = false;
    }
  }

  update() async {
    if (_stopped) {
      //TODO create here protection from misclick

      _timerController.reset();
      await _timeTrackService.reset();

      _timerController.begin = _timeTrackService.getTrackedTime();
      _timerController.start();
      await _timeTrackService.saveStart();
      _stopped = false;


    } else if (startButtonText == TrackStatus.RUNNING.buttonText) {
      _timerController.pause();

    } else if (startButtonText == TrackStatus.PAUSED.buttonText) {
      _timerController.begin = _timeTrackService.getTrackedTime();
      _timerController.start();
    }

    notifyListeners();
  }

  stop() {
    _timerController.pause();
    _stopped = true;

    // _timeTrackService.sa(trackedSeconds);

    startButtonText = TrackStatus.STOPPED.buttonText;
    notifyListeners();
  }
}

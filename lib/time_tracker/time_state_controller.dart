import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_stack/time_tracker/data/track_status.dart';
import 'package:my_stack/time_tracker/service/time_track_service.dart';

class TrackTimeController extends ChangeNotifier {

  String startButtonText = "Start";

  final TimeTrackService _timeTrackService;
  final CustomTimerController _timerController;
  bool _stopped = true;

  CustomTimerState _customTimerState = CustomTimerState.reset;
  int _trackedSeconds = 0;


  TrackTimeController(this._timerController, this._timeTrackService) {
    _timerController.begin = _timeTrackService.getTrackedTime();


    if(_timeTrackService.getStatus() == TrackStatus.RUNNING.name) {
      startButtonText = "Pause";
    }

    if(_timeTrackService.getStatus() == TrackStatus.PAUSED.name) {
      startButtonText = "Resume";
    }


    _timerController.state.addListener(() {
      _customTimerState = _timerController.state.value; // 👉 CustomTimerState.paused

      //TODO refactor it
      _trackedSeconds = int.parse(_timerController.remaining.value.seconds);
      _timeTrackService.saveTime(int.parse(_timerController.remaining.value.seconds));// 👉 12h
    });
  }


  update() {
    if(_stopped) {
      _timerController.reset();
      //TODO create here protection from misclick
      _timeTrackService.reset();

      _timerController.begin = _timeTrackService.getTrackedTime();
      _timerController.start();
      _timeTrackService.saveStart();

      _stopped = false;
      startButtonText = "Pause";

    } else if(startButtonText == "Pause") {
      startButtonText = "Resume";

      _timeTrackService.savePause(_trackedSeconds);
      _timerController.pause();

    } else if(startButtonText == "Resume") {
      startButtonText = "Pause";

      _timerController.begin = _timeTrackService.getTrackedTime();
      _timerController.start();
      _timeTrackService.saveResume();
    }

    notifyListeners();
  }

  stop() {
    startButtonText = "Start";
    notifyListeners();

    _timerController.pause();
    _timeTrackService.saveStop(_trackedSeconds);

    _stopped = true;
  }
}
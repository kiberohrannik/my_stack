import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_stack/time_tracker/data/track_status.dart';
import 'package:my_stack/time_tracker/service/hive_time_track_service.dart';

class TrackTimeController extends ChangeNotifier {

  final HiveTimeTrackService _timeTrackService;
  final CustomTimerController _timerController;

  bool _stopped = true;
  bool _continueRunning = false;
  late String startButtonText;


  TrackTimeController(this._timerController, this._timeTrackService) {
    _timerController.state.addListener(() => _listenTimerState());

    //Resolve initial state of timer when opening app
    var status = _timeTrackService.getStatus();

    _updateStartButtonText(status);
    _timerController.begin = _timeTrackService.getTime();

    if(status == TrackStatus.PAUSED) {
      _stopped = false;
    }


    if(status == TrackStatus.RUNNING) {
      _stopped = false;
      _continueRunning = true;
      _timerController.remaining.value = CustomTimerRemainingTime(duration: _timerController.begin);
      _timerController.start();
    }
  }

  
  update() {
    if (_stopped) {
      _timeTrackService.reset();
      _timerController.begin = Duration.zero;
      _timerController.remaining.value = CustomTimerRemainingTime(duration: Duration.zero);
      _timerController.state.value = CustomTimerState.finished;

      _resetStopState();
      _timeTrackService.saveStart();
      _timerController.start();

    } else if (startButtonText == TrackStatus.RUNNING.buttonText) {
      _resetStopState();
      _timerController.pause();

    } else if (startButtonText == TrackStatus.PAUSED.buttonText) {
      _timerController.begin = _timeTrackService.getTime();
      _resetStopState();
      _timerController.start();
    }
  }

  stop() {
    _continueRunning = false;
    _stopped = true;

    _updateStartButtonText(TrackStatus.STOPPED);

    if(_timerController.state.value == CustomTimerState.paused) {
      _listenTimerState();
    } else {
      _timerController.pause();
    }
  }


  void _listenTimerState() {
    var status = TrackStatus.getStatus(_timerController.state.value);

    if (_stopped && status == TrackStatus.PAUSED) {
      status = TrackStatus.STOPPED;
    }

    _updateStartButtonText(status);

    _timeTrackService.saveTime(
        seconds: _timerController.remaining.value.duration.inSeconds,
        trackStatus: status,
        continueRunning: _continueRunning);
  }

  void _updateStartButtonText(TrackStatus status) {
    startButtonText = status.buttonText;
    notifyListeners();
  }
  
  void _resetStopState() {
    _continueRunning = false;
    _stopped = false;
  }
}

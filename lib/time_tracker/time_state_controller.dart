import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_stack/time_tracker/data/track_status.dart';
import 'package:my_stack/time_tracker/service/hive_time_track_service.dart';

class TrackTimeController extends ChangeNotifier {

  final HiveTimeTrackService _timeTrackService;
  final CustomTimerController _timerController;

  bool stopped = true;
  bool _continueRunning = false;
  late String startButtonText;
  late String stopButtonText = "Stop";


  TrackTimeController(this._timerController, this._timeTrackService) {
    _updateStopped(stopped);

    _timerController.state.addListener(() => _listenTimerState());

    //Resolve initial state of timer when opening app
    var status = _timeTrackService.getStatus();

    _updateButtonsText(status);
    _timerController.begin = _timeTrackService.getTime();

    if(status == TrackStatus.paused) {
      _updateStopped(false);
    }


    if(status == TrackStatus.running) {
      _updateStopped(false);

      _continueRunning = true;
      _timerController.remaining.value = CustomTimerRemainingTime(duration: _timerController.begin);
      _timerController.start();
    }
  }

  
  update() {
    if (stopped) {
      _updateStopped(false);
      _timeTrackService.reset();
      _timerController.begin = Duration.zero;
      _timerController.remaining.value = CustomTimerRemainingTime(duration: Duration.zero);
      _timerController.state.value = CustomTimerState.finished;

      _resetStopState();
      _timeTrackService.saveStart();
      _timerController.start();

    } else if (startButtonText == TrackStatus.running.startButtonText) {
      _resetStopState();
      _timerController.pause();

    } else if (startButtonText == TrackStatus.paused.startButtonText) {
      _timerController.begin = _timeTrackService.getTime();
      _resetStopState();
      _timerController.start();
    }
  }

  stop() {
    _continueRunning = false;
    _updateStopped(true);

    _updateButtonsText(TrackStatus.stopped);

    if(_timerController.state.value == CustomTimerState.paused) {
      _listenTimerState();
    } else {
      _timerController.pause();
    }
  }


  void _listenTimerState() {
    var status = TrackStatus.getStatus(_timerController.state.value);

    if (stopped && status == TrackStatus.paused) {
      status = TrackStatus.stopped;
    }

    _updateButtonsText(status);

    _timeTrackService.saveTime(
        seconds: _timerController.remaining.value.duration.inSeconds,
        trackStatus: status,
        continueRunning: _continueRunning);
  }

  void _updateButtonsText(TrackStatus status) {
    startButtonText = status.startButtonText;
    stopButtonText = status.stopButtonText;
    notifyListeners();
  }
  
  void _resetStopState() {
    _continueRunning = false;
    _updateStopped(false);
  }

  bool _updateStopped(bool value) {
    stopped = value;
    notifyListeners();
    return stopped;
  }
}

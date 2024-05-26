import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_stack/time_tracker/data/track_status.dart';
import 'package:my_stack/time_tracker/service/hive_time_track_service.dart';
import 'package:my_stack/time_tracker/service/time_track_service.dart';

class TrackTimeController extends ChangeNotifier {

  final HiveTimeTrackService _timeTrackService;
  final CustomTimerController _timerController;

  bool _stopped = true;
  bool _continue_running = false;
  late String startButtonText;

  TrackTimeController(this._timerController, this._timeTrackService) {

    startButtonText = _timeTrackService.getStatus().buttonText;
    notifyListeners();

    // _timerController.state.addListener(() {
    //   TrackStatus trackStatus = TrackStatus.getStatus(_timerController.state.value);
    //
    //   if(_stopped && trackStatus == TrackStatus.PAUSED) {
    //     trackStatus = TrackStatus.STOPPED;
    //   }
    //   startButtonText = trackStatus.buttonText;
    //   notifyListeners();
    //
    //   _timeTrackService.saveTime(
    //       trackedSeconds: _timerController.remaining.value.duration.inSeconds,
    //       trackStatus: trackStatus,
    //       continueRunning: _continue_running
    //   );
    // });

    _timerController.state.addListener(() => _listenTimerState());

    if(_timeTrackService.getStatus() == TrackStatus.PAUSED) {
      _stopped = false;
    }

    if(_timeTrackService.getStatus() == TrackStatus.STOPPED) {
      _stopped = true;
      startButtonText = TrackStatus.STOPPED.buttonText;
      notifyListeners();
    }


    _timerController.begin = _timeTrackService.getTrackedTime();

    if(_timeTrackService.getStatus() == TrackStatus.RUNNING) {
      _continue_running = true;
      _stopped = false;
      _timerController.remaining.value = CustomTimerRemainingTime(duration: _timerController.begin);
      _timerController.start();
    }
  }

  update() async {
    if (_stopped) {
      await _timeTrackService.reset();
      _timerController.begin = Duration.zero;
      _timerController.remaining.value = CustomTimerRemainingTime(duration: Duration.zero);
      _timerController.state.value = CustomTimerState.finished;

      // _timerController.begin = _timeTrackService.getTrackedTime();
      _stopped = false;
      _continue_running = false;
      await _timeTrackService.saveStart();
      _timerController.start();

    } else if (startButtonText == TrackStatus.RUNNING.buttonText) {
      _continue_running = false;
      _stopped = false;
      _timerController.pause();

    } else if (startButtonText == TrackStatus.PAUSED.buttonText) {
      _timerController.begin = _timeTrackService.getTrackedTime();
      _continue_running = false;
      _stopped = false;
      _timerController.start();
    }
  }

  // stop() async {
  //   _continue_running = false;
  //   _stopped = true;
  //
  //   startButtonText = TrackStatus.STOPPED.buttonText;
  //   notifyListeners();
  //   _timerController.pause();
  //
  //   await _timeTrackService.saveStatus(TrackStatus.STOPPED);
  // }

  stop() async {
    _continue_running = false;
    _stopped = true;

    startButtonText = TrackStatus.STOPPED.buttonText;
    notifyListeners();

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
    startButtonText = status.buttonText;
    notifyListeners();

    _timeTrackService.saveTime(
        trackedSeconds: _timerController.remaining.value.duration.inSeconds,
        trackStatus: status,
        continueRunning: _continue_running);
  }
}

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';

class TrackTimeController extends ChangeNotifier {

  String startButtonText = "Start";

  final CustomTimerController _timerController;
  bool _stopped = true;

  TrackTimeController(this._timerController);


  update() {
    if(_stopped) {
      _timerController.reset();
      _timerController.start();
      _stopped = false;
      startButtonText = "Pause";

    } else if(startButtonText == "Pause") {
      startButtonText = "Resume";
      _timerController.pause();

    } else if(startButtonText == "Resume") {
      startButtonText = "Pause";
      _timerController.start();
    }

    notifyListeners();
  }

  stop() {
    startButtonText = "Start";
    notifyListeners();
    _timerController.pause();
    _stopped = true;
  }
}
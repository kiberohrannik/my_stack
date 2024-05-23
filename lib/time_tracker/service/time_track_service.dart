import 'package:my_stack/time_tracker/data/time_shot.dart';

abstract class TimeTrackService {

  Duration getTrackedTime();

  String getStatus();

  void saveStart();

  void savePause(int trackedSeconds);

  void saveResume();

  void saveStop(int trackedSeconds);

  void saveTime(int trackedSeconds);

  //debug purpose only
  void reset();
}
import '../data/track_status.dart';

abstract class TimeTrackService {

  Duration getTrackedTime();

  TrackStatus getStatus();

  void saveStart();

  void savePause(int trackedSeconds);

  void saveResume();

  void saveStop(int trackedSeconds);

  Future<void> saveStateWhenRunning(int trackedSeconds);

  void saveTime({required int trackedSeconds, required TrackStatus trackStatus});

  //debug purpose only
  void reset();

  void printSmth(int trackedSeconds);
}
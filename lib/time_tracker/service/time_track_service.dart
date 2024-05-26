import '../data/track_status.dart';

abstract class TimeTrackService {

  void saveStart();

  void reset();

  Duration getTime();

  void saveTime({required int seconds, required TrackStatus trackStatus, required bool continueRunning});

  TrackStatus getStatus();

  void saveStatus(TrackStatus trackStatus);
}
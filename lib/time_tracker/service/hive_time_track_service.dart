import 'package:hive/hive.dart';
import 'package:my_stack/time_tracker/service/time_track_service.dart';

import '../data/time_shot.dart';
import '../data/track_status.dart';

class HiveTimeTrackService extends TimeTrackService {

  static const String timeTrackKey = 'time_shot';
  static Box<TimeShot>? _box;


  static void initStorage() async {
    _box = await Hive.openBox("time_track");
  }


  @override
  Duration getTrackedTime() {
    if(_box?.isNotEmpty ?? false) {
      var timeShot = _get();
      return Duration(seconds: int.parse(timeShot?.duration ?? '0'));

    } else {
      return Duration.zero;
    }
  }

  @override
  void saveStart() {
    _box?.put(timeTrackKey, TimeShot(DateTime.timestamp(), TrackStatus.RUNNING));
  }

  @override
  void savePause(int trackedSeconds) {
    var timeShot = _get();
    var currentStatus = timeShot?.status;

    if(currentStatus != null && currentStatus == TrackStatus.RUNNING) {
      timeShot?.duration = trackedSeconds.toString();
      timeShot?.status = TrackStatus.PAUSED;

      _box?.put(timeTrackKey, timeShot!);
    }
  }

  @override
  void saveResume() {
    var timeShot = _get();

    var currentStatus = timeShot?.status;
    if(currentStatus != null && currentStatus == TrackStatus.PAUSED) {
      timeShot?.status = TrackStatus.RUNNING;

      _box?.put(timeTrackKey, timeShot!);
    }
  }

  @override
  void saveStop(int trackedSeconds) {
    var timeShot = _get();

    timeShot?.duration = trackedSeconds.toString();
    timeShot?.status = TrackStatus.STOPPED;

    _box?.put(timeTrackKey, timeShot!);
  }

  @override
  void reset() {
    var timeShot = _get();
    timeShot?.start = DateTime.timestamp();
    timeShot?.duration = 0.toString();
    timeShot?.status = TrackStatus.STOPPED;

    timeShot?.save();
  }


  TimeShot? _get() => _box?.get(timeTrackKey);

  @override
  void saveTime(int trackedSeconds) {
    var timeShot = _get();
    timeShot?.duration = trackedSeconds.toString();
    timeShot?.save();
  }

  @override
  String getStatus() {
    return _get()?.status.name ?? "";
  }
}
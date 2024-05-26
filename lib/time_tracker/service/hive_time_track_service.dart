import 'package:hive/hive.dart';
import 'package:my_stack/time_tracker/service/time_track_service.dart';

import '../data/time_shot.dart';
import '../data/track_status.dart';

class HiveTimeTrackService {
  static const String timeTrackKey = 'time_shot';
  static Box<TimeShot>? _box;

  static Future<void> initStorage() async {
    _box = await Hive.openBox("time_track");
  }

  Duration getTrackedTime() {
    var timeShot = _get();

    if(timeShot != null && timeShot.status == TrackStatus.FINISHED) {
      timeShot.duration = DateTime.timestamp().difference(timeShot.stop).inSeconds + timeShot.duration;
      timeShot.status = TrackStatus.RUNNING;
      saveDuration(timeShot);
      return Duration(seconds:timeShot.duration);
    }

    return Duration(seconds: _get()?.duration ?? 0);
  }

  void saveDuration(TimeShot timeShot) async {
    return await _box?.put(timeTrackKey, timeShot);
  }

  Future<void> saveStart() async {
    return await _box?.put(timeTrackKey, TimeShot(DateTime.timestamp(), TrackStatus.RUNNING));
  }

  // void savePause(int trackedSeconds) {
  //   var timeShot = _get();
  //
  //   if (timeShot != null && timeShot.status == TrackStatus.RUNNING) {
  //     timeShot.duration = trackedSeconds;
  //     timeShot.status = TrackStatus.PAUSED;
  //     timeShot.save();
  //   }
  // }

  // void saveResume() {
  //   var timeShot = _get();
  //
  //   if (timeShot != null && timeShot.status == TrackStatus.PAUSED) {
  //     timeShot.status = TrackStatus.RUNNING;
  //     timeShot.save();
  //   }
  // }

  // Future<void> saveStop(int trackedSeconds) {
  //   var timeShot = _get();
  //
  //   if (timeShot != null) {
  //     timeShot.duration = trackedSeconds;
  //     timeShot.status = TrackStatus.STOPPED;
  //     timeShot.stop = DateTime.timestamp();
  //   }
  //
  //   return timeShot?.save() ?? Future.value();
  // }

  Future<void> reset() {
    var timeShot = _get();
    timeShot?.start = DateTime.timestamp();
    timeShot?.duration = 0;
    timeShot?.status = TrackStatus.STOPPED;

    return timeShot?.save() ?? Future.value();
  }

  void saveTime({required int trackedSeconds, required TrackStatus trackStatus}) async {
    var timeShot = _get();
    timeShot?.duration = trackedSeconds;
    timeShot?.status = trackStatus;
    timeShot?.stop = DateTime.timestamp();
    return await timeShot?.save();
  }

  TrackStatus getStatus() => _get()?.status ?? TrackStatus.STOPPED;


  TimeShot? _get() {
    if(_box == null) {
      throw Exception('Null hive box!');
    }

    return  _box?.get(timeTrackKey);
  }

  // Future<void> saveStateWhenRunning(int trackedSeconds) async {
  //   var timeShot = _get();
  //
  //   if (timeShot != null) {
  //     timeShot.stop = DateTime.timestamp();
  //     timeShot.duration = trackedSeconds;
  //     timeShot.status = TrackStatus.RUNNING_CLOSED;
  //   }
  //
  //   return await _box?.put(timeTrackKey, timeShot!);
  //
  // }

  void printSmth(int trackedSeconds) {
    var timeShot = _get();

    if (timeShot != null) {
      timeShot.stop = DateTime.timestamp();
      timeShot.duration = trackedSeconds;
      timeShot.status = TrackStatus.RUNNING;

      print("timeShot: stop = ${timeShot.stop} duration = ${timeShot.duration} status = ${timeShot.status}");

      print("\n\nfsmgbfdj **** duration: ${DateTime
          .timestamp()
          .difference(timeShot.stop)
          .inSeconds + timeShot.duration}");
    }
  }
}

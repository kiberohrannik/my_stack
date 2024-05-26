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

    if(timeShot != null && timeShot.status == TrackStatus.RUNNING) {
      assert (_box?.values.isNotEmpty ?? false);

      timeShot.duration = DateTime.timestamp().difference(timeShot.countingStart).inSeconds;
      timeShot.status = TrackStatus.RUNNING;
      _saveDuration(timeShot);
      return Duration(seconds:timeShot.duration);
    }

    return Duration(seconds: _get()?.duration ?? 0);
  }

  Future<void> saveStart() async {
    var timeShot = TimeShot(DateTime.timestamp(), TrackStatus.RUNNING);
    timeShot.countingStart = DateTime.timestamp();
    return await _box?.put(timeTrackKey, timeShot);
  }

  Future<void>? saveStatus(TrackStatus trackStatus) async {
    var timeShot = _get();
    timeShot?.status = trackStatus;
    return await timeShot?.save();
  }

  Future<void> reset() {
    var timeShot = _get();
    timeShot?.initialStart = DateTime.timestamp();
    timeShot?.countingStart = DateTime.timestamp();
    timeShot?.duration = 0;
    timeShot?.status = TrackStatus.STOPPED;

    return timeShot?.save() ?? Future.value();
  }

  void saveTime({required int trackedSeconds, required TrackStatus trackStatus, required bool continueRunning}) async {
    var timeShot = _get();

    if(trackStatus == TrackStatus.RUNNING && !continueRunning) {
      timeShot?.countingStart = DateTime.timestamp();
      print("countingStart ${timeShot?.countingStart}");
    }

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

  void _saveDuration(TimeShot timeShot) async {
    return await _box?.put(timeTrackKey, timeShot);
  }
}

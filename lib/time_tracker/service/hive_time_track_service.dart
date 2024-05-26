import 'package:hive/hive.dart';
import 'package:my_stack/time_tracker/service/time_track_service.dart';

import '../data/time_shot.dart';
import '../data/track_status.dart';

class HiveTimeTrackService extends TimeTrackService {
  static const String timeKey = 'time_shot';
  static Box<TimeShot>? _box;

  static Future<void> initStorage() async {
    _box = await Hive.openBox("time_track");
  }

  @override
  void saveStart() async => await _box?.put(timeKey, TimeShot(DateTime.timestamp(), TrackStatus.RUNNING));

  @override
  void reset() {
    var time = _get();
    time?.initialStart = DateTime.timestamp();
    time?.countingStart = DateTime.timestamp();
    time?.duration = 0;
    time?.status = TrackStatus.STOPPED;
    _save(time);
  }

  @override
  Duration getTime() {
    var time = _get();
    if(time != null && time.status == TrackStatus.RUNNING) {
      time.duration = DateTime.timestamp().difference(time.countingStart).inSeconds;
      _save(time);
    }
    return Duration(seconds: time?.duration ?? 0);
  }

  @override
  void saveTime({required int seconds, required TrackStatus trackStatus, required bool continueRunning}) async {
    var time = _get();

    if(trackStatus == TrackStatus.RUNNING && !continueRunning) {
      time?.countingStart = DateTime.timestamp();
    }

    time?.duration = seconds;
    time?.status = trackStatus;
    time?.stop = DateTime.timestamp();
    _save(time);
  }

  @override
  TrackStatus getStatus() => _get()?.status ?? TrackStatus.STOPPED;

  @override
  void saveStatus(TrackStatus trackStatus) {
    var time = _get();
    time?.status = trackStatus;
    _save(time);
  }


  TimeShot? _get() {
    if(_box == null) {
      throw Exception('Null hive box!');
    }
    return _box?.get(timeKey);
  }
  
  Future<void> _save(TimeShot? timeShot) async => await timeShot?.save();
}

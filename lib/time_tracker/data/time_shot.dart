import 'package:hive/hive.dart';
import 'package:my_stack/time_tracker/data/track_status.dart';

part 'time_shot.g.dart';

@HiveType(typeId: 0, adapterName: 'TimeShotAdapter')
class TimeShot extends HiveObject {

  @HiveField(0)
  DateTime initialStart = DateTime.timestamp();

  @HiveField(1)
  DateTime stop = DateTime.timestamp();

  @HiveField(2)
  int duration = 0;

  @HiveField(3)
  TrackStatus status = TrackStatus.STOPPED;

  @HiveField(4)
  DateTime countingStart = DateTime.timestamp();

  TimeShot(this.initialStart, this.status);
}
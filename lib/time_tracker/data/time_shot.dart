import 'package:hive/hive.dart';
import 'package:my_stack/time_tracker/data/track_status.dart';

part 'time_shot.g.dart';

@HiveType(typeId: 0, adapterName: 'TimeShotAdapter')
class TimeShot extends HiveObject {

  @HiveField(0)
  DateTime start = DateTime.timestamp();

  @HiveField(1)
  String duration = '0';

  @HiveField(2)
  TrackStatus status = TrackStatus.STOPPED;

  // @HiveField(3)
  // DateTime stop = DateTime.timestamp();


  TimeShot(this.start, this.status);
}
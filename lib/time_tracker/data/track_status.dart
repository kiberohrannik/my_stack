import 'package:hive/hive.dart';

part 'track_status.g.dart';


@HiveType(typeId: 1)
enum TrackStatus {

  @HiveField(0)
  STOPPED,

  @HiveField(1)
  RUNNING,

  @HiveField(2)
  PAUSED
}
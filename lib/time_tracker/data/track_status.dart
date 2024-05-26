import 'package:custom_timer/custom_timer.dart';
import 'package:hive/hive.dart';

part 'track_status.g.dart';


@HiveType(typeId: 1)
enum TrackStatus {

  @HiveField(0)
  stopped("Start", CustomTimerState.reset),

  @HiveField(1)
  running("Pause", CustomTimerState.counting),

  @HiveField(2)
  paused("Resume", CustomTimerState.paused),

  @HiveField(3)
  finished("Resume", CustomTimerState.finished);


  final String buttonText;
  final CustomTimerState timerState;

  const TrackStatus(this.buttonText, this.timerState);


  static TrackStatus getStatus(CustomTimerState timerState) {
    return TrackStatus.values
        .where((el) => el.timerState == timerState)
        .first;
  }
}
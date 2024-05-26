import 'package:custom_timer/custom_timer.dart';
import 'package:hive/hive.dart';

part 'track_status.g.dart';


@HiveType(typeId: 1)
enum TrackStatus {

  @HiveField(0)
  STOPPED("Start", CustomTimerState.reset),

  @HiveField(1)
  RUNNING("Pause", CustomTimerState.counting),

  @HiveField(2)
  PAUSED("Resume", CustomTimerState.paused),

  @HiveField(3)
  FINISHED("Start", CustomTimerState.finished),

  @HiveField(4)
  RUNNING_CLOSED("Pause", CustomTimerState.counting);


  final String buttonText;
  final CustomTimerState timerState;

  const TrackStatus(this.buttonText, this.timerState);


  static TrackStatus getStatus(CustomTimerState timerState) {
    return TrackStatus.values
        .where((el) => el.timerState == timerState)
        .first;
  }
}
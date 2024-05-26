import 'package:custom_timer/custom_timer.dart';
import 'package:hive/hive.dart';

part 'track_status.g.dart';


@HiveType(typeId: 1)
enum TrackStatus {

  @HiveField(0)
  stopped("Start", "Stopped", CustomTimerState.reset),

  @HiveField(1)
  running("Pause", "Stop", CustomTimerState.counting),

  @HiveField(2)
  paused("Resume", "Stop", CustomTimerState.paused),

  @HiveField(3)
  finished("Resume", "Stop", CustomTimerState.finished);


  final String startButtonText;
  final String stopButtonText;
  final CustomTimerState timerState;

  const TrackStatus(this.startButtonText, this.stopButtonText, this.timerState);


  static TrackStatus getStatus(CustomTimerState timerState) {
    return TrackStatus.values
        .where((el) => el.timerState == timerState)
        .first;
  }
}
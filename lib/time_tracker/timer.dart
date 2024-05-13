import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:my_stack/styles/font_style_mixin.dart';

class StackTimer extends StatelessWidget with FontStyleMixin {
  
  final CustomTimerController timerController;
  
  const StackTimer({super.key, required this.timerController});
  
  
  @override
  Widget build(BuildContext context) {
    return CustomTimer(
        controller: timerController,
        builder: (state, time) {
          return Text(
              "${time.hours}:${time.minutes}:${time.seconds}",
              style: textStyle(fontSize: 40)
          );
        });
  }
}
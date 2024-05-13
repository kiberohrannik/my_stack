import 'package:flutter/material.dart';

class TimeTrackButtonContainer extends StatelessWidget {

  final Widget button;

  const TimeTrackButtonContainer({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 125,
      width: 125,
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.purpleAccent,
        ),
      ),

      child: button,
    );
  }
}
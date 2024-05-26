import 'package:flutter/material.dart';
import 'package:my_stack/styles/font_style_mixin.dart';

class TrackTimeHistoryItem extends StatefulWidget {
  final String text;
  final double? opacity;

  const TrackTimeHistoryItem({super.key, required this.text, this.opacity});

  @override
  State<StatefulWidget> createState() => _TrackTimeHistoryItemState();
}

class _TrackTimeHistoryItemState extends State<TrackTimeHistoryItem> with FontStyleMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: 3),

      decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),

      child: ListTile(

        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        title: Text(widget.text, style: textStyle(opacity: widget.opacity)),
      ),
    );
  }
}

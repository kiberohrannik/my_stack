import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomAppBarMenu extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BottomAppBarMenuState();
  }

}

class _BottomAppBarMenuState extends State<BottomAppBarMenu> {

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () => {},
          child: Column(
            children: [
              Icon(Icons.home_outlined, color: Colors.deepOrange.shade600),
              Text("Home", style: GoogleFonts.jetBrainsMono(fontSize: 14, color: Colors.deepOrange.shade600))
            ],
          ),
        ),

        TextButton(
          onPressed: () => {},
          child: Column(
            children: [
              Icon(Icons.access_alarm_outlined, color: Colors.grey.shade500),
              Text("Reminder", style: GoogleFonts.jetBrainsMono(fontSize: 14, color: Colors.grey.shade500))
            ],
          ),
        ),

        TextButton(
          onPressed: () => {},
          child: Column(
            children: [
              Icon(Icons.electric_bolt_outlined, color: Colors.grey.shade500),
              Text("TODO", style: GoogleFonts.jetBrainsMono(fontSize: 14, color: Colors.grey.shade500))
            ],
          ),
        ),

        TextButton(
          onPressed: () => {  },
          child: Column(
            children: [
              Icon(Icons.link_outlined, color: Colors.grey.shade500),
              Text("Saved", style: GoogleFonts.jetBrainsMono(fontSize: 14, color: Colors.grey.shade500))
            ],
          ),
        ),
      ],
    );
  }

}
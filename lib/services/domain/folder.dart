import 'package:flutter/cupertino.dart';

class SavedLinkFolder {
  static const String saved = "SAVED";
  static const String archived = "ARCHIVED";
}

class Folder {
  String displayText;
  String name;
  Icon icon;

  Folder({required this.name, required this.icon, required this.displayText});
}
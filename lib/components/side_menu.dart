import 'package:flutter/material.dart';
import 'package:my_stack/styles/styles.dart';

class SideMenu extends ListView {

  static const Widget menuHeader = DrawerHeader(
      decoration: BoxDecoration(color: AppColor.accentYellowDark),
      child: Text('To explore', textAlign: TextAlign.center));

  SideMenu({
    super.key,
    required List<Widget> entries
  }) : super(
      children: _collectChildren(entries),
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0)
  );


  static List<Widget> _collectChildren(List<Widget> entries) {
    entries.insert(0, menuHeader);
    return entries;
  }
}
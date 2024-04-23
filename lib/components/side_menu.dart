import 'package:flutter/material.dart';
import 'package:my_stack/styles/styles.dart';

class SideMenu2 extends ListView {
  static const Widget menuHeader = DrawerHeader(
      decoration: BoxDecoration(
          // color: AppColor.accentYellowDark
          ),
      child: Text('To explore', textAlign: TextAlign.center));

  SideMenu2({super.key, required List<Widget> entries})
      : super(
            children: _collectChildren(entries),
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0));

  static List<Widget> _collectChildren(List<Widget> entries) {
    entries.insert(0, menuHeader);
    return entries;
  }
}

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<StatefulWidget> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(),
              child: Text('To explore', textAlign: TextAlign.center)
          ),

          ListTile(
            title: const Text('Saved links'),
            leading: const Icon(Icons.link),
            onTap: () => {}
          ),

          ListTile(
            title: const Text('Trash'),
            leading: const Icon(Icons.delete_forever),
            onTap: () => {}
          )
        ],
      ),
    );
  }
}

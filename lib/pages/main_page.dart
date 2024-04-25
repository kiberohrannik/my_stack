import 'package:flutter/material.dart';
import 'package:my_stack/components/app_bar.dart';
import 'package:my_stack/pages/saved_links_view.dart';
import 'package:my_stack/services/saved_links.dart';
import 'package:my_stack/styles/styles.dart';

import '../components/drawer_header.dart';
import '../main.dart';
import '../services/domain/folder.dart';

class MainPage extends StatefulWidget {
  MainPage({
    super.key,
    required this.title,
    required this.body,
    required this.savedLinkService,
  });

  final Widget body;
  String title;
  final SavedLinkService savedLinkService;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final List<Folder> _folders = widget.savedLinkService.getFolders();

  void _showSavedLinks(Folder folder) {
    setState(() {
      widget.title = folder.displayText;
    });

    navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
        builder: (context) => SavedLinksView(
            savedLinkService: widget.savedLinkService, folder: folder.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(gradient: GradientColor.blueGradient),
      child: Scaffold(
          key: _scaffoldKey,
          body: widget.body,
          backgroundColor: Colors.transparent,
          appBar: MyStackAppBar(widget.title),
          drawer: Drawer(
              surfaceTintColor: Colors.blue,
              backgroundColor: AppColor.blackBlue,
              child: Container(
                  child: Column(
                children: [
                  MyStackDrawerHeader(scaffoldKey: _scaffoldKey),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _folders.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(_folders[index].displayText),
                            leading: _folders[index].icon,
                            onTap: () {
                              _showSavedLinks(_folders[index]);
                              _scaffoldKey.currentState!.closeDrawer();
                            });
                      },
                    ),
                  )
                ],
              )))),
    );
  }
}

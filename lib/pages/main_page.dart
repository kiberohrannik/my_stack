import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stack/components/app_bar.dart';
import 'package:my_stack/components/bottom_app_bar_menu.dart';
import 'package:my_stack/pages/saved_links_view.dart';
import 'package:my_stack/services/saved_links.dart';
import 'package:my_stack/styles/colorful-theme.dart';

import '../components/bottom_app_bar.dart';
import '../components/drawer_header.dart';
import '../main.dart';
import '../services/domain/folder.dart';
import '../styles/dark-theme.dart';

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

    widget.savedLinkService.removeHided();

    navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
        builder: (context) => SavedLinksView(
            savedLinkService: widget.savedLinkService, folder: folder.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(gradient: DarkGradientColor.blueGradient),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,

        appBar: MyStackAppBar(widget.title),
        bottomNavigationBar: MyStackBottomAppBar(child: BottomAppBarMenu()),

        body: widget.body
      ),
    );
  }
}

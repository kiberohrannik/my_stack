import 'package:flutter/material.dart';
import 'package:my_stack/pages/main_page.dart';
import 'package:my_stack/pages/saved_links_view.dart';
import 'package:my_stack/pages/welcome_view.dart';
import 'package:my_stack/services/domain/folder.dart';
import 'package:my_stack/services/domain/saved_link.dart';
import 'package:my_stack/services/in_memory_saved_links.dart';
import 'package:my_stack/services/saved_links.dart';
import 'package:share_handler/share_handler.dart';

import 'main.dart';

class MyStackApp extends StatefulWidget {
  const MyStackApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyStackAppState();
}

class _MyStackAppState extends State<MyStackApp> {
  final SavedLinkService _savedLinkService = InMemorySavedLinkService();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    final handler = ShareHandlerPlatform.instance;

    handler.sharedMediaStream.listen((SharedMedia media) {
      if (!mounted) return;
      if (media.content != null) {
        setState(() {
          _savedLinkService.add(
              SavedLink(url: media.content!, folder: SavedLinkFolder.saved));
        });
      }
    });
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Stack',

        themeMode: ThemeMode.dark,

        navigatorKey: navigatorKey,

        initialRoute: 'homeRoute',

        // onGenerateRoute: (settings) {
        //   if (settings.name == '/saved') {
        //     return MaterialPageRoute(builder: (_) => SavedLinksView(savedLinkService: _savedLinkService, )); // Pass it to BarPage.
        //   }
        // },

        builder: (context, child) => MainPage(
            title: 'My Stack',
            body: child!,
            savedLinkService: _savedLinkService),
        routes: {
          'homeRoute': (context) => WelcomeView(),
        });
  }
}

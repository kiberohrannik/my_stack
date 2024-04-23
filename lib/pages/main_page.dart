import 'package:flutter/material.dart';
import 'package:my_stack/components/app_bar.dart';
import 'package:my_stack/pages/saved_links_page.dart';
import 'package:my_stack/services/in_memory_saved_links.dart';
import 'package:my_stack/services/saved_link.dart';
import 'package:my_stack/services/saved_links.dart';
import 'package:my_stack/styles/styles.dart';
import 'package:share_handler/share_handler.dart';

import '../main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title, required this.body});

  final Widget body;
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final SavedLinkService savedLinkService = InMemorySavedLinkService();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    final handler = ShareHandlerPlatform.instance;

    handler.sharedMediaStream.listen((SharedMedia media) {
      if (!mounted) return;
      setState(() {
        if(media.content != null) {
          savedLinkService.add(SavedLink(url: media.content!));
        }
      });
    });
    if (!mounted) return;
  }

  void _showSavedLinks() {
    navigatorKey.currentState!.pushNamed('newViewRoute');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(gradient: GradientColor.blueGradient),

      child: Scaffold(
        body: widget.body,

        backgroundColor: Colors.transparent,
        appBar: MyStackAppBar(widget.title),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),

            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Text('To explore', textAlign: TextAlign.center)
              ),

              ListTile(
                  title: const Text('Saved links'),
                  leading: const Icon(Icons.link),
                  onTap: () => _showSavedLinks()
              ),
            ],
          ),
        )
      ),
    );
  }
}

import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:my_stack/components/app_bar.dart';
import 'package:my_stack/components/side_menu.dart';
import 'package:my_stack/service/in_memory_saved_links.dart';
import 'package:my_stack/service/saved_links.dart';
import 'package:my_stack/styles.dart';
import 'package:share_handler/share_handler.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final SavedLinkService savedLinkService = InMemorySavedLinkService();
  bool savedLinksVisible = false;

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
        savedLinkService.add(media.content);
      });
    });
    if (!mounted) return;
  }

  void _showLinks() {
    savedLinksVisible = true;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: savedLinksVisible,
        child: ListView.builder(
          itemCount: savedLinkService.getAll().length,
          itemBuilder: (context, index) {
            return AnyLinkPreview(
              link: savedLinkService.getAll()[index],
              onTap: () => Future.value,
            );
          })
      ),
      backgroundColor: AppColor.backWhite,
      appBar: MyStackAppBar(widget.title),
      drawer: Drawer(
        backgroundColor: AppColor.backWhite,
        child: SideMenu(
          entries: [
            ListTile(
                title: const Text('Saved links'),
                leading: const Icon(Icons.link),
                splashColor: AppColor.lightGrey,
                onTap: () => _showLinks())
          ],
        ),
      ),
    );
  }
}

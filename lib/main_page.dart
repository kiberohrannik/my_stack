import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:my_stack/components/app_bar.dart';
import 'package:my_stack/components/side_menu.dart';
import 'package:my_stack/service/in_memory_saved_links.dart';
import 'package:my_stack/service/saved_link.dart';
import 'package:my_stack/service/saved_links.dart';
import 'package:my_stack/styles/styles.dart';
import 'package:share_handler/share_handler.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final SavedLinkService savedLinkService = InMemorySavedLinkService();

  List<SavedLink> _links = [];
  
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
    setState(() {
      _links = savedLinkService.getAllSaved();
    });

    Navigator.of(context).pop();
  }

  void _showArchivedLinks() {
    setState(() {
      _links = savedLinkService.getAllArchived();
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
          visible: true,
          child: ListView.builder(
              itemCount: _links.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    color: AppColor.accentOrange,
                    child: const Text('Delete', style: TextStyle(fontSize: 20))
                  ),
                  direction: DismissDirection.startToEnd,
                  key: Key(_links[index].id),
                  child: AnyLinkPreview(
                    link: _links[index].url,
                    onTap: () => Future.value,
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      _links = savedLinkService.removeById(_links[index].id);
                    });
                  },
                );
              })),
      backgroundColor: AppColor.backWhite,
      appBar: MyStackAppBar(widget.title),
      drawer: Drawer(
        backgroundColor: AppColor.backWhite,
        child: SideMenu(
          entries: [
            ListTile(
                title: const Text('Saved links'),
                leading: const Icon(Icons.link),
                // splashColor: AppColor.lightGrey,
                onTap: () => _showSavedLinks()),
            ListTile(
                title: const Text('Trash'),
                leading: const Icon(Icons.delete_forever),
                // splashColor: AppColor.lightGrey,
                onTap: () => _showArchivedLinks())
          ],
        ),
      ),
    );
  }
}

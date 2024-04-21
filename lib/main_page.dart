import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_stack/components/app_bar.dart';
import 'package:my_stack/components/side_menu.dart';
import 'package:my_stack/styles.dart';
import 'package:share_handler/share_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> _links = [];
  SharedMedia? media;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    final handler = ShareHandlerPlatform.instance;
    media = await handler.getInitialSharedMedia();

    handler.sharedMediaStream.listen((SharedMedia media) {
      if (!mounted) return;
      setState(() {
        this.media = media;
      });
    });
    if (!mounted) return;
  }



  void _createLinks() {
    Navigator.pop(context);

    setState(() {
      print(_links.length);
      print(media?.content);

      if(media?.content != null) {
        _links.add(media!.content!);
        media = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          itemCount: _links.length,
          itemBuilder: (context, index) {
            return AnyLinkPreview(
              link: _links[index],
              onTap: () => Future.value,
            );
          }),
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
                onTap: () => _createLinks())
          ],
        ),
      ),
    );
  }
}

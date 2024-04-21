import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_stack/components/app_bar.dart';
import 'package:my_stack/components/side_menu.dart';
import 'package:my_stack/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> _links = [];

  void _createLinks(String url) {
    Navigator.pop(context);

    setState(() {
      _links.add(url);
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
                onTap: () => _createLinks("https://stackoverflow.com/"))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/saved_links_page.dart';
import '../services/in_memory_saved_links.dart';
import '../services/saved_links.dart';
import '../styles/styles.dart';
import 'app_bar.dart';

class BaseView extends StatefulWidget {

  final Widget child;
  final String title;

  const BaseView(this.child, this.title, {super.key});

  @override
  State<StatefulWidget> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {

  void _showSavedLinks() {
    final SavedLinkService savedLinkService = InMemorySavedLinkService();

    Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => SavedLinksPage(savedLinkService))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(gradient: GradientColor.blueGradient),

      child: Scaffold(
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
          ),
          body: widget.child,
      ),
    );
  }
}
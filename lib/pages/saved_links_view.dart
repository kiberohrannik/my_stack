import 'package:flutter/material.dart';

import '../components/link_preview.dart';
import '../services/saved_link.dart';
import '../services/saved_links.dart';

class SavedLinksView extends StatefulWidget {
  final SavedLinkService _savedLinkService;

  const SavedLinksView(this._savedLinkService, {super.key, String? route});

  @override
  State<StatefulWidget> createState() => _SavedLinksViewState();
}

class _SavedLinksViewState extends State<SavedLinksView> {
  late List<SavedLink> _links = widget._savedLinkService.getAllSaved();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 20),
      child: ListView.builder(
          itemCount: _links.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: const Text('Delete', style: TextStyle(fontSize: 20))
              ),
              direction: DismissDirection.startToEnd,
              key: Key(_links[index].id),
              child: LinkPreview(_links[index].url),
              onDismissed: (direction) {
                setState(() {
                  _links = widget._savedLinkService.removeById(_links[index].id);
                });
              },
            );
          }),
    );
  }
}
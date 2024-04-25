import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/link_preview.dart';
import '../services/domain/saved_link.dart';
import '../services/saved_links.dart';

class SavedLinksView extends StatefulWidget {
  final SavedLinkService savedLinkService;
  final String folder;

  const SavedLinksView({super.key, required this.savedLinkService, required this.folder});

  @override
  State<StatefulWidget> createState() => _SavedLinksViewState();
}

class _SavedLinksViewState extends State<SavedLinksView> {

  List<SavedLink> _links() =>
      widget.savedLinkService.getAll(widget.folder);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),

      child: ListenableBuilder(
        listenable: widget.savedLinkService,
        builder: (context, child) => ListView.builder(
            itemCount: _links().length,
            itemBuilder: (context, index) {
              return Visibility(
                visible: _links()[index].visible,
                  child: Dismissible(
                behavior: HitTestBehavior.translucent ,
                background: Container(
                    color: Color(0x33FFFFFF),
                    margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 0),
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text('Delete', style: GoogleFonts.jetBrainsMono(color: Colors.white, textStyle: TextStyle(fontSize: 20)))
                ),
                direction: DismissDirection.endToStart,
                key: Key(_links()[index].id),
                child: LinkPreview(_links()[index].url),
                onDismissed: (direction) {


                  // widget.savedLinkService.removeById(_links()[index].id);

                  widget.savedLinkService.hide(_links()[index].id);


                },
              )
              );

            }),
      )
    );
  }
}
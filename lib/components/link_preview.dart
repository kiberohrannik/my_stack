import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';

import '../styles/dark-theme.dart';

class LinkPreview extends StatelessWidget {


  final String url;

  const LinkPreview(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child:
      AnyLinkPreview(
        backgroundColor: DarkColor.blackBlue,
        titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        bodyStyle: TextStyle(color: Colors.white),
        borderRadius: 0,
        link: url,
        onTap: () => Future.value,
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_stack/example/use_push_token.dart';
import 'package:share_plus/share_plus.dart';

class MetadataSliver extends HookWidget {
  const MetadataSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pushToken = usePushToken();
    final shareButtonGlobalKey = GlobalKey();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Push Token', style: Theme.of(context).textTheme.headlineMedium),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                key: shareButtonGlobalKey,
                icon: const Icon(
                  Icons.share,
                  color: Colors.blue,
                ),
                onPressed: () {
                  print("The push token is: ${pushToken.value}");
                  final box = shareButtonGlobalKey.currentContext
                      ?.findRenderObject() as RenderBox;
                  final position = box.localToGlobal(Offset.zero);
                  final rect =
                      Rect.fromLTWH(position.dx, position.dy, 200, 200);
                  Share.share("The push token is: ${pushToken.value}",
                      sharePositionOrigin: rect);
                },
              ),
              Expanded(child: Text(pushToken.value.toString()))
            ],
          ),
        ],
      ),
    );
  }
}

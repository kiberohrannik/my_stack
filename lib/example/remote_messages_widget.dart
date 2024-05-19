
import 'package:flutter/cupertino.dart';
import 'package:my_stack/example/text_row.dart';
import 'package:push/push.dart';

class RemoteMessagesWidget extends StatelessWidget {
  final List<RemoteMessage> remoteMessages;

  const RemoteMessagesWidget(this.remoteMessages, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (remoteMessages.isEmpty) {
      return const Text("No remote messages");
    }
    return Column(
      children: [
        ...remoteMessages
            .map((message) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextRow("Title", message.notification?.title.toString()),
                      TextRow("Body", message.notification?.body.toString()),
                      TextRow("Data", message.data?.toString())
                    ],
                  ),
                ))
            .toList()
      ],
    );
  }
}

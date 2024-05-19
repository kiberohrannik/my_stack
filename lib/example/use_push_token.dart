
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:push/push.dart';

/// A custom reusable hook that gets your the push token (APNs device token or FCM registration token)
ValueNotifier<String?> usePushToken() {
  final pushToken = useState<String?>(null);
  useEffect(() {
    Push.instance.token.then((value) {
      pushToken.value = value;
    });
    return null;
  });
  return pushToken;
}

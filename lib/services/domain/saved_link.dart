import 'package:uuid/uuid.dart';

class SavedLink {

  static const Uuid _uuid = Uuid();

  String id = _uuid.v1();
  String url;
  String folder;
  bool visible = true;

  SavedLink({required this.url, required this.folder});

}
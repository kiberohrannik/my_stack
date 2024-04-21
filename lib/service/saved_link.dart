import 'package:uuid/uuid.dart';

class SavedLink {

  static const Uuid _uuid = Uuid();

  String id = _uuid.v1();
  String url;
  bool isArchived = false;

  SavedLink({required this.url, this.isArchived = false});

}
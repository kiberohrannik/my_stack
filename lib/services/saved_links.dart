import 'package:flutter/cupertino.dart';
import 'package:my_stack/services/domain/saved_link.dart';

import 'domain/folder.dart';

abstract class SavedLinkService with ChangeNotifier {
  List<SavedLink> getAll(String folder);

  void add(SavedLink? link);

  void removeById(String id);
  void hide(String id);

  void removeHided();

  List<Folder> getFolders();
}

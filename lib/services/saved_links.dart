import 'package:my_stack/services/domain/saved_link.dart';

import 'domain/folder.dart';

abstract class SavedLinkService {
  List<SavedLink> getAll(String folder);

  void add(SavedLink? link);

  List<SavedLink> removeById(String id);

  List<Folder> getFolders();
}

import 'package:my_stack/service/saved_link.dart';

abstract class SavedLinkService {
  List<SavedLink> getAllSaved();

  List<SavedLink> getAllArchived();

  void add(SavedLink? link);

  List<SavedLink> removeById(String id);
}

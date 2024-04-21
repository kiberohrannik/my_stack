import 'package:my_stack/service/saved_link.dart';
import 'package:my_stack/service/saved_links.dart';

class InMemorySavedLinkService extends SavedLinkService {
  final Map<String, SavedLink> _links = {};

  @override
  List<SavedLink> getAllSaved() =>
      _links.values.where((e) => !e.isArchived).toList();

  @override
  List<SavedLink> getAllArchived() =>
      _links.values.where((e) => e.isArchived).toList();

  @override
  void add(SavedLink? link) {
    if (link != null) {
      _links[link.id] = link;
    }
  }

  @override
  List<SavedLink> removeById(String id) {
    if (_links.containsKey(id)) {
      if (_links[id]!.isArchived) {
        _links.remove(id);
        return getAllArchived();
      } else {
        _links.update(id, (value) {
          value.isArchived = true;
          return value;
        });

        return getAllSaved();
      }
    }

    return [];
  }
}

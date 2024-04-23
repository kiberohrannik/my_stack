import 'package:my_stack/services/saved_link.dart';
import 'package:my_stack/services/saved_links.dart';

class InMemorySavedLinkService extends SavedLinkService {
  final Map<String, SavedLink> _links = {};

  InMemorySavedLinkService() {
    generateLinks();
  }

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


  void generateLinks() {
    List<String> urls = [
      "https://www.tutorialspoint.com/dart_programming/dart_programming_map.htm",
    "https://github.com/bcgit/bc-java/blob/main/pkix/src/test/java/org/bouncycastle/cert/cmp/test/AllTests.java",
    "https://stackoverflow.com/questions/70404351/how-to-change-the-primary-color-for-themedata-dark-in-flutter",
    "https://docs.flutter.dev/cookbook/design/package-fonts",
    "https://colorhunt.co/palettes/grey",
    "https://docs.oracle.com/javase/9/docs/specs/security/standard-names.html",
    "https://api.flutter.dev/flutter/widgets/Listener-class.html"
    ];

    urls.forEach((element) {
      SavedLink newLink = SavedLink(url: element);
      _links[newLink.id] = newLink;
    });
  }
}

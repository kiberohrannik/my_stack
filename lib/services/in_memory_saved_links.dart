import 'package:flutter/material.dart';
import 'package:my_stack/services/domain/saved_link.dart';
import 'package:my_stack/services/saved_links.dart';

import 'domain/folder.dart';

class InMemorySavedLinkService extends SavedLinkService {
  final Map<String, SavedLink> _links = {};
  final List<Folder> _folders = [];

  InMemorySavedLinkService() {
    _generateLinks();
    _generateFolders();
  }

  @override
  List<SavedLink> getAll(String folder) =>
      _links.values.where((e) => e.folder == folder).toList().reversed.toList();

  @override
  void add(SavedLink? link) {
    if (link != null) {
      _links[link.id] = link;
      notifyListeners();
    }
  }

  @override
  void removeById(String id) {
    if (_links.containsKey(id)) {

      String folder = _links[id]!.folder;
      if (_links[id]!.folder == SavedLinkFolder.archived) {
        _links.remove(id);
      } else {
        _links.update(id, (value) {
          value.folder = SavedLinkFolder.archived;
          return value;
        });
      }

      notifyListeners();
    }
  }

  @override
  List<Folder> getFolders() {
    return _folders;
  }

  @override
  void hide(String id) {
    _links[id]?.visible = false;
    notifyListeners();
  }

  @override
  void removeHided() {
    _links.removeWhere((key, value) => !value.visible && value.folder == SavedLinkFolder.archived);
    _links.updateAll((key, value) {
      if(!value.visible) {
        value.visible = true;
        value.folder = SavedLinkFolder.archived;
      }
      return value;
    });

    notifyListeners();
  }

  void _generateLinks() {
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
      SavedLink newLink = SavedLink(url: element, folder: SavedLinkFolder.saved);
      _links[newLink.id] = newLink;
    });
  }

  void _generateFolders() {
    _folders.add(Folder(name: SavedLinkFolder.saved, icon: Icon(Icons.link_outlined), displayText: "Saved links"));
    _folders.add(Folder(name: SavedLinkFolder.archived, icon: Icon(Icons.delete_forever_outlined), displayText: "Bin"));
  }
}

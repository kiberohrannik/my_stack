import 'package:my_stack/service/saved_links.dart';

class InMemorySavedLinkService extends SavedLinkService {

  final List<String> _savedUrls = [];

  @override
  List<String> getAll() => _savedUrls;

  @override
  void add(String? link) {
    if(link != null) {
      _savedUrls.add(link);
    }
  }
}
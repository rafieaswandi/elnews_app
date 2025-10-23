import 'package:aplication_news/models/bookmark_models.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BookmarkController extends GetxController {
  final bookmarks = <Bookmark>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  void addBookmark(Bookmark article) {
    if (!bookmarks.any((b) => b.url == article.url)) {
      bookmarks.add(article);
      saveBookmarks();
    }
  }

  void removeBookmark(String url) {
    bookmarks.removeWhere((b) => b.url == url);
    saveBookmarks();
  }

  void saveBookmarks() {
    box.write('bookmarks', bookmarks.map((b) => b.toJson()).toList());
  }

  void loadBookmarks() {
    final stored = box.read<List>('bookmarks') ?? [];
    bookmarks.value = stored.map((e) => Bookmark.fromJson(Map<String, dynamic>.from(e))).toList();
  }
}

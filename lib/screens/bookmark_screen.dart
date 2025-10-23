import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bookmark_controller.dart';

class BookmarkScreen extends StatelessWidget {
  final bookmarkController = Get.put(BookmarkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: Obx(() {
        if (bookmarkController.bookmarks.isEmpty) {
          return const Center(child: Text('No bookmarks yet.'));
        }

        return ListView.builder(
          itemCount: bookmarkController.bookmarks.length,
          itemBuilder: (context, index) {
            final b = bookmarkController.bookmarks[index];
            return ListTile(
              leading: Image.network(b.imageUrl, width: 80, fit: BoxFit.cover),
              title: Text(b.title),
              subtitle: Text(b.source),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => bookmarkController.removeBookmark(b.url),
              ),
              onTap: () {
                // open article page or use url_launcher
              },
            );
          },
        );
      }),
    );
  }
}

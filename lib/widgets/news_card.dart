import 'package:aplication_news/core/routes.dart';
import 'package:aplication_news/core/utils.dart';
import 'package:aplication_news/models/bookmark_models.dart';
import 'package:aplication_news/models/news_models.dart';
import 'package:aplication_news/controller/bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  final bookmarkController = Get.put(BookmarkController());

  NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: const BorderSide(color: Colors.grey, width: 1.0),
      ),
      child: InkWell(
        onTap: () => Get.toNamed(AppRouter.news, arguments: article),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 🖼️ Image Section
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox(
                    width: 180,
                    child: article.urlToImage != null
                        ? Image.network(
                            article.urlToImage!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.withAlpha(100),
                                child: const Center(
                                  child: Icon(Icons.error, color: Colors.red),
                                ),
                              );
                            },
                          )
                        : Container(
                            color: Colors.grey.withAlpha(100),
                            child: Center(
                              child: Text(
                                'No Image',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ),
                  ),
                ),

                const SizedBox(width: 16.0),

                // 📰 Text Section + Bookmark Button
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(label: Text(article.source?.name ?? '')),
                          // 🔖 Bookmark Button
                          Obx(() {
                            final isBookmarked = bookmarkController.bookmarks
                                .any((b) => b.url == article.url);
                            return IconButton(
                              icon: Icon(
                                isBookmarked
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                color:
                                    isBookmarked ? Colors.amber : Colors.grey,
                              ),
                              onPressed: () {
                                if (isBookmarked) {
                                  bookmarkController.removeBookmark(article.url!);
                                } else {
                                  bookmarkController.addBookmark(
                                    Bookmark(
                                      title: article.title ?? '',
                                      url: article.url ?? '',
                                      imageUrl: article.urlToImage ?? '',
                                      source: article.source?.name ?? '',
                                      publishedAt:
                                          article.publishedAt?.toString() ?? '',
                                    ),
                                  );
                                }
                              },
                            );
                          }),
                        ],
                      ),
                      Text(
                        article.title ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        article.description ??
                            article.content ??
                            '',
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          article.publishedAt != null
                              ? Utils.dateFormat(article.publishedAt!)
                              : '',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

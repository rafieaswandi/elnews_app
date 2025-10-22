import 'package:aplication_news/core/routes.dart';
import 'package:aplication_news/core/utils.dart';
import 'package:aplication_news/models/news_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
// import 'package:intl/intl.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: const BorderSide(color: Colors.grey, width: 10.0),
      ),
      child: InkWell(
        onTap: () => Get.toNamed(AppRouter.news, arguments: article),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image - Nullable
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  width: 180,
                  child: article.urlToImage != null
                      ? Image.network(
                          article.urlToImage!,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.withAlpha(100),
                              child: Center(
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
              const SizedBox(width: 16.0,),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Chip(label: Text(article.source?.name ?? '')),
                    Text(
                      article.title ?? '',
                      style: Theme.of(context).textTheme.titleMedium ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      article.description != null
                      ? article.description!
                      : article.content ?? '',
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
                      )
                    )
                  ],
                )
                )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
import 'package:aplication_news/core/utils.dart';
import 'package:aplication_news/models/news_models.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final Article article;
  const NewsScreen({super.key, required this.article, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
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
                              value: loadingProgress.expectedTotalBytes != null
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
                      height: 200,
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
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Chip(label: Text(article.source?.name ?? 'Unknown')),
          ),
          const SizedBox(height: 8.0),
          // Title
          Text(
            article.title ?? '',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          // Author - Date Published
          Text(
            '${article.author ?? 'Unknown'} - ${Utils.dateFormat(article.publishedAt!)}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const Divider(height: 32.0),
          // Description
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.0,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(article.description ?? 'No description available'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // Content
          Text(
            article.content?.substring(0, 200) ?? 'No content available',
            textAlign: TextAlign.justify,
          ),
          RichText(
            text: TextSpan(
              text: article.content?.substring(0, 200) ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                article.content != null
                    ? TextSpan(
                        text: 'Read more',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await Utils.openUrl(article.url ?? '');
                          },
                      )
                    : const TextSpan(),
              ],
            ),
          ),
          const SizedBox(height: 200),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          spacing: 8.0,
          children: [
            // Open Url
            Expanded(
            child: FilledButton(
              onPressed: () async => await Utils.openUrl(article.url ?? ''),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(50.0),
              ),
              child: const Text('Read Full Article'),
              ),
            ),
            // Toggle Bookmark
            OutlinedButton.icon(
              onPressed: () {},
              label: Icon(Icons.bookmark_add_outlined, size: 24.0,),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(50.0, 50.0)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
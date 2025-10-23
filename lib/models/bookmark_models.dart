class Bookmark {
  final String title;
  final String url;
  final String imageUrl;
  final String source;
  final String publishedAt;

  Bookmark({
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.source,
    required this.publishedAt,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      title: json['title'],
      url: json['url'],
      imageUrl: json['imageUrl'],
      source: json['source'],
      publishedAt: json['publishedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
        'imageUrl': imageUrl,
        'source': source,
        'publishedAt': publishedAt,
      };
}

class Article {
  final String id;
  final String title;
  final String? description;
  final String? author;
  final String? publishedAt;
  final String? imageUrl;
  final String? source;
  final String? content;
  final String? url;
  final DateTime? publishedDate;

  Article({
    required this.id,
    required this.title,
    this.description,
    this.author,
    this.publishedAt,
    this.imageUrl,
    this.source,
    this.content,
    this.url,
    this.publishedDate,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(String? dateString) {
      if (dateString == null) return null;
      try {
        return DateTime.parse(dateString);
      } catch (e) {
        return null;
      }
    }

    return Article(
      id:
          json['id']?.toString() ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      title: json['title']?.toString() ?? 'No Title',
      description: json['description']?.toString(),
      author: json['author']?.toString(),
      publishedAt: json['publishedAt']?.toString(),
      publishedDate: parseDate(json['publishedAt']?.toString()),
      imageUrl: json['urlToImage']?.toString(),
      source: json['source'] is Map ? json['source']['name']?.toString() : null,
      content: json['content']?.toString(),
      url: json['url']?.toString(),
    );
  }

  String get formattedDate {
    if (publishedDate == null) return '';

    final now = DateTime.now();
    final difference = now.difference(publishedDate!);

    if (difference.inMinutes < 1) return 'Just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes}m ago';
    if (difference.inHours < 24) return '${difference.inHours}h ago';
    if (difference.inDays < 7) return '${difference.inDays}d ago';

    return '${publishedDate!.day}/${publishedDate!.month}/${publishedDate!.year}';
  }
}

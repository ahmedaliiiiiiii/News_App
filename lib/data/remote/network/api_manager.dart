// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../../../ui/resources/article_model.dart';
import '../../models/source_responce.dart';
import 'dio_client.dart';

class ApiManager {
  static const String _apiKey = "563c82d28f6d4f88b28a8a083d59f49e";
  static final Map<String, dynamic> _cache = {};
  static const Duration _cacheDuration = Duration(minutes: 5);

  static Future<SourceResponse?> getSources(String category) async {
    final cacheKey = 'sources_$category';

    // Check cache first
    if (_cache.containsKey(cacheKey)) {
      final cached = _cache[cacheKey];
      if (cached is SourceResponse && _isCacheValid(cacheKey)) {
        return cached;
      }
    }

    try {
      final response = await DioClient.instance.get(
        "/v2/top-headlines/sources",
        queryParameters: {"apiKey": _apiKey, "category": category},
      );

      if (response.statusCode == 200) {
        final sourceResponse = SourceResponse.fromJson(response.data);
        _cache[cacheKey] = sourceResponse;
        _cache['${cacheKey}_timestamp'] = DateTime.now();
        return sourceResponse;
      }
      return null;
    } on DioException catch (e) {
      print('Error fetching sources: ${e.message}');
      return null;
    }
  }

  static Future<List<Article>> getArticlesBySource(String sourceId) async {
    final cacheKey = 'articles_$sourceId';

    // Check cache first
    if (_cache.containsKey(cacheKey)) {
      final cached = _cache[cacheKey];
      if (cached is List<Article> && _isCacheValid(cacheKey)) {
        return cached;
      }
    }

    try {
      final response = await DioClient.instance.get(
        "/v2/top-headlines",
        queryParameters: {
          "sources": sourceId,
          "apiKey": _apiKey,
          "pageSize": 20,
          "sortBy": "publishedAt",
        },
      );

      if (response.statusCode == 200) {
        final articles = _parseArticles(response.data);
        _cache[cacheKey] = articles;
        _cache['${cacheKey}_timestamp'] = DateTime.now();
        return articles;
      }
      return [];
    } on DioException catch (e) {
      print('Error fetching articles: ${e.message}');
      return [];
    }
  }

  // Similar caching for other methods...
  static Future<List<Article>> getArticlesByCategory(String category) async {
    final cacheKey = 'articles_category_$category';

    if (_cache.containsKey(cacheKey)) {
      final cached = _cache[cacheKey];
      if (cached is List<Article> && _isCacheValid(cacheKey)) {
        return cached;
      }
    }

    try {
      final response = await DioClient.instance.get(
        "/v2/top-headlines",
        queryParameters: {
          "category": category,
          "apiKey": _apiKey,
          "pageSize": 20,
          "country": "us",
          "sortBy": "publishedAt",
        },
      );

      if (response.statusCode == 200) {
        final articles = _parseArticles(response.data);
        _cache[cacheKey] = articles;
        _cache['${cacheKey}_timestamp'] = DateTime.now();
        return articles;
      }
      return [];
    } on DioException catch (e) {
      print('Error fetching category articles: ${e.message}');
      return [];
    }
  }

  static Future<List<Article>> searchNews(String query) async {
    final cacheKey = 'search_$query';

    if (_cache.containsKey(cacheKey)) {
      final cached = _cache[cacheKey];
      if (cached is List<Article> && _isCacheValid(cacheKey)) {
        return cached;
      }
    }

    try {
      final response = await DioClient.instance.get(
        "/v2/everything",
        queryParameters: {
          "q": query,
          "apiKey": _apiKey,
          "pageSize": 20,
          "sortBy": "publishedAt",
          "language": "en",
        },
      );

      if (response.statusCode == 200) {
        final articles = _parseArticles(response.data);
        _cache[cacheKey] = articles;
        _cache['${cacheKey}_timestamp'] = DateTime.now();
        return articles;
      }
      return [];
    } on DioException catch (e) {
      print('Error searching news: ${e.message}');
      return [];
    }
  }

  static bool _isCacheValid(String cacheKey) {
    final timestampKey = '${cacheKey}_timestamp';
    if (_cache.containsKey(timestampKey)) {
      final timestamp = _cache[timestampKey] as DateTime;
      return DateTime.now().difference(timestamp) < _cacheDuration;
    }
    return false;
  }

  static void clearCache() {
    _cache.clear();
  }

  static List<Article> _parseArticles(Map<String, dynamic> data) {
    if (data['articles'] != null && data['articles'] is List) {
      final articles = <Article>[];

      for (final articleJson in data['articles']) {
        try {
          if (articleJson is Map<String, dynamic>) {
            final article = Article.fromJson(articleJson);
            if (article.title.isNotEmpty) {
              articles.add(article);
            }
          }
        } catch (e) {
          continue;
        }
      }

      // Sort with newest articles first
      articles.sort((a, b) {
        final dateA = a.publishedDate;
        final dateB = b.publishedDate;
        if (dateA == null && dateB == null) return 0;
        if (dateA == null) return 1;
        if (dateB == null) return -1;
        return dateB.compareTo(dateA);
      });

      return articles;
    }
    return [];
  }
}

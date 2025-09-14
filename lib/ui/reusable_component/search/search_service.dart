// ignore_for_file: unused_import

import 'package:dio/dio.dart';

import '../../../data/remote/network/api_manager.dart';
import '../../resources/article_model.dart';

class SearchService {
  static Future<List<Article>> search(String query) async {
    return await ApiManager.searchNews(query);
  }

  static Future<List<Article>> searchArticles(String query) async {
    try {
      // Use the centralized API manager
      return await ApiManager.searchNews(query);
    } catch (e) {
      return [];
    }
  }

  static Future<List<String>> getSearchSuggestions(String query) async {
    final popular = [
      'Technology',
      'Sports',
      'Business',
      'Entertainment',
      'Politics',
      'Health',
      'Science',
      'World News',
    ];

    if (query.isEmpty) {
      return popular;
    }

    return [
      '$query news',
      '$query articles',
      '$query updates',
      '$query trends',
      'latest $query',
      '$query today',
      '$query 2024',
      '$query breaking news',
      ...popular.where(
        (category) => category.toLowerCase().contains(query.toLowerCase()),
      ),
    ];
  }
}

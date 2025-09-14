// ignore_for_file: dead_code

import 'package:flutter/material.dart';

import '../../../data/remote/network/news_repository.dart';
import '../../resources/article_model.dart';
import '../../resources/color_manager.dart';
import 'search_service.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final NewsRepository newsRepository = NewsRepository();

  CustomSearchDelegate() : super(searchFieldLabel: "Search for news...");

  @override
  List<Widget> buildActions(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return [
      if (query.isNotEmpty)
        IconButton(
          icon: Icon(
            Icons.clear,
            color: isDark
                ? ColorManager.LightContrast
                : ColorManager.DarkContrast,
          ),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: isDark ? ColorManager.LightContrast : ColorManager.DarkContrast,
      ),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSuggestions(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(
          'Enter a search term',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return FutureBuilder<List<Article>>(
      future: SearchService.searchArticles(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          bool isDark = false;
          return Center(
            child: CircularProgressIndicator(
              color: isDark
                  ? ColorManager.LightContrast
                  : ColorManager.DarkContrast,
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final articles = snapshot.data ?? [];

        if (articles.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search_off, size: 64),
                const SizedBox(height: 16),
                const Text('No results found'),
                Text('Try different keywords'),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return ListTile(
              title: Text(article.title),
              subtitle: Text(article.author ?? 'Unknown'),
              onTap: () => _showArticleDetail(context, article),
            );
          },
        );
      },
    );
  }

  Widget _buildSuggestions(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: SearchService.getSearchSuggestions(query),
      builder: (context, snapshot) {
        final suggestions = snapshot.data ?? [];

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.search),
              title: Text(suggestions[index]),
              onTap: () {
                query = suggestions[index];
                showResults(context);
              },
            );
          },
        );
      },
    );
  }

  void _showArticleDetail(BuildContext context, Article article) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(article.title),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.imageUrl != null && article.imageUrl!.isNotEmpty)
                Image.network(article.imageUrl!),
              const SizedBox(height: 12),
              Text('By: ${article.author ?? "Unknown"}'),
              const SizedBox(height: 8),
              if (article.description != null &&
                  article.description!.isNotEmpty)
                Text(article.description!),
              const SizedBox(height: 12),
              if (article.content != null && article.content!.isNotEmpty)
                Text(article.content!),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

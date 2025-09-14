// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:news/ui/resources/color_manager.dart';

import '../../data/models/source.dart';
import '../../data/remote/network/news_repository.dart';
import '../resources/article_model.dart';

class ArticlesList extends StatelessWidget {
  final Source source;
  final NewsRepository newsRepository = NewsRepository();

  ArticlesList({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    return FutureBuilder<List<Article>>(
      future: newsRepository.getArticlesBySource(source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: isDark
                  ? ColorManager.LightColor
                  : ColorManager.DarkContrast,
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64),
                const SizedBox(height: 16),
                const Text('Failed to load articles'),
              ],
            ),
          );
        }

        final articles = snapshot.data ?? [];

        if (articles.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.article_outlined, size: 64),
                const SizedBox(height: 16),
                Text('No articles from ${source.name ?? 'this source'}'),
              ],
            ),
          );
        }

        return ListView.builder(
          physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return _buildArticleItem(context, article);
          },
        );
      },
    );
  }

  Widget _buildArticleItem(BuildContext context, Article article) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('By: ${article.author ?? 'Unknown'}'),
        onTap: () => _showArticleDetail(context, article),
      ),
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
              if (article.description != null) Text(article.description!),
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

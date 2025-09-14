import '../../../ui/resources/article_model.dart';
import '../../models/source_responce.dart';
import 'api_manager.dart';

class NewsRepository {
  Future<SourceResponse?> getSources(String category) =>
      ApiManager.getSources(category);

  Future<List<Article>> getArticlesBySource(String sourceId) =>
      ApiManager.getArticlesBySource(sourceId); // Use the correct method name

  Future<List<Article>> getArticlesByCategory(String category) =>
      ApiManager.getArticlesByCategory(category); // Use the correct method name

  Future<List<Article>> searchNews(String query) =>
      ApiManager.searchNews(query);
}

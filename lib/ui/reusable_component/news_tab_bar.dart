// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:news/ui/resources/color_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../data/models/source.dart';
import '../../data/remote/network/api_manager.dart';
import '../resources/article_model.dart';
import '../screens/article_details_screen.dart';
import '../widgets/article_widget.dart';
import '../widgets/quick_brief_bottom_sheet.dart';

class NewsTabBar extends StatefulWidget {
  final String category;
  const NewsTabBar({super.key, required this.category});

  @override
  State<NewsTabBar> createState() => _NewsTabBarState();
}

class _NewsTabBarState extends State<NewsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Source> _sources = [];
  final Map<String, List<Article>> _articlesBySource = {};
  final Map<String, bool> _loadingStates = {};
  final Map<String, RefreshController> _refreshControllers = {};
  int _currentTabIndex = 0;
  bool _sourcesLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSources();
  }

  Future<void> _loadSources() async {
    try {
      final response = await ApiManager.getSources(widget.category);
      if (response != null && response.sources != null) {
        setState(() {
          _sources = response.sources!;
          _tabController = TabController(length: _sources.length, vsync: this);
          _tabController.addListener(_onTabChanged);

          // Initialize refresh controllers for each source
          for (var source in _sources) {
            if (source.id != null) {
              _refreshControllers[source.id!] = RefreshController();
            }
          }
          _sourcesLoading = false;
        });

        // Load articles for the first tab
        if (_sources.isNotEmpty && _sources.first.id != null) {
          _loadArticlesForSource(_sources.first.id!, true);
        }
      } else {
        setState(() => _sourcesLoading = false);
      }
    } catch (e) {
      setState(() => _sourcesLoading = false);
    }
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      setState(() => _currentTabIndex = _tabController.index);

      final sourceId = _sources[_currentTabIndex].id;
      if (sourceId != null &&
          (!_articlesBySource.containsKey(sourceId) ||
              _articlesBySource[sourceId]!.isEmpty)) {
        _loadArticlesForSource(sourceId, false);
      }
    }
  }

  Future<void> _loadArticlesForSource(String sourceId, bool initialLoad) async {
    if (initialLoad) {
      setState(() => _loadingStates[sourceId] = true);
    }

    try {
      final articles = await ApiManager.getArticlesBySource(sourceId);
      setState(() {
        _articlesBySource[sourceId] = articles;
        _loadingStates[sourceId] = false;
      });
    } catch (e) {
      setState(() => _loadingStates[sourceId] = false);
    }
  }

  Future<void> _onRefresh(String sourceId) async {
    await _loadArticlesForSource(sourceId, false);
    _refreshControllers[sourceId]?.refreshCompleted();
  }

  void _onArticleTap(Article article) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(article.title),
        content: SingleChildScrollView(
          child: Text(article.description ?? 'No description available'),
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

  void _onArticleLongPress(Article article) {
    _showQuickBrief(context, article);
  }

  void _showQuickBrief(BuildContext context, Article article) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => QuickBriefBottomSheet(article: article),
    );
  }

  void _navigateToArticleDetails(BuildContext context, Article article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetailsScreen(article: article),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    // Dispose all refresh controllers
    _refreshControllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (_sourcesLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: isDark
              ? ColorManager.LightContrast
              : ColorManager.DarkContrast,
        ),
      );
    }

    if (_sources.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: isDark ? ColorManager.GreyLight : ColorManager.GreyDark,
            ),
            const SizedBox(height: 16),
            Text(
              "No sources available",
              style: TextStyle(
                color: isDark
                    ? ColorManager.LightContrast
                    : ColorManager.DarkContrast,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadSources,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark
                    ? ColorManager.LightContrast
                    : ColorManager.DarkContrast,
                foregroundColor: isDark
                    ? ColorManager.DarkContrast
                    : ColorManager.LightContrast,
              ),
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Tab Bar with custom styling
        Container(
          decoration: BoxDecoration(
            color: isDark ? ColorManager.DarkColor : ColorManager.LightColor,
            border: Border(
              bottom: BorderSide(
                color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
                width: 1,
              ),
            ),
          ),
          child: TabBar(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            tabAlignment: TabAlignment.start,
            dividerHeight: 0,
            controller: _tabController,
            isScrollable: true,
            automaticIndicatorColorAdjustment: true,
            enableFeedback: true,

            indicatorColor: isDark
                ? ColorManager.LightContrast
                : ColorManager.DarkContrast,
            labelColor: isDark
                ? ColorManager.LightContrast
                : ColorManager.DarkContrast,
            unselectedLabelColor: isDark
                ? ColorManager.GreyLight
                : ColorManager.GreyDark,
            tabs: _sources
                .map(
                  (source) => Tab(
                    child: Text(
                      source.name ?? "No Name",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                )
                .toList(),
          ),
        ),

        Expanded(
          child: TabBarView(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            controller: _tabController,
            children: _sources.map((source) {
              final sourceId = source.id;
              if (sourceId == null) {
                return Center(
                  child: Text(
                    "Invalid source",
                    style: TextStyle(
                      color: isDark
                          ? ColorManager.LightContrast
                          : ColorManager.DarkContrast,
                    ),
                  ),
                );
              }

              final articles = _articlesBySource[sourceId] ?? [];
              final isLoading = _loadingStates[sourceId] ?? true;
              final refreshController =
                  _refreshControllers[sourceId] ?? RefreshController();

              if (isLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: isDark
                        ? ColorManager.LightContrast
                        : ColorManager.DarkContrast,
                  ),
                );
              }

              if (articles.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.article_outlined,
                        size: 48,
                        color: isDark
                            ? ColorManager.GreyLight
                            : ColorManager.GreyDark,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "No articles available",
                        style: TextStyle(
                          color: isDark
                              ? ColorManager.LightContrast
                              : ColorManager.DarkContrast,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _onRefresh(sourceId),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark
                              ? ColorManager.LightContrast
                              : ColorManager.DarkContrast,
                          foregroundColor: isDark
                              ? ColorManager.DarkContrast
                              : ColorManager.LightContrast,
                        ),
                        child: const Text("Refresh"),
                      ),
                    ],
                  ),
                );
              }

              return SmartRefresher(
                controller: refreshController,
                onRefresh: () => _onRefresh(sourceId),
                header: WaterDropHeader(
                  waterDropColor: isDark
                      ? ColorManager.LightContrast
                      : ColorManager.DarkContrast,
                  complete: Icon(
                    Icons.check,
                    color: isDark
                        ? ColorManager.LightContrast
                        : ColorManager.DarkContrast,
                  ),
                ),
                child: ListView.separated(
                  physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                  itemCount: articles.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return ArticleWidget(
                      article: article,
                      onTap: () => _onArticleTap(article),
                      onLongPress: () => _onArticleLongPress(article),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../reusable_component/custom_search_delegate.dart';
import '../../reusable_component/news_tab_bar.dart';
import '../../reusable_component/source_content.dart';

class SportsNewsScreen extends StatelessWidget {
  const SportsNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> sources = [
      'ESPN',
      'Sky Sports',
      'BBC Sport',
      'Fox Sports',
      'NBA News',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search, color: ColorManager.DarkColor),
          ),
        ],
      ),
      body: NewsTabBar(
        tabNames: sources,
        tabViews: sources
            .map((source) => SourceContent(source: source, category: 'Sports'))
            .toList(),
      ),
    );
  }
}

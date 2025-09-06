import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../reusable_component/custom_search_delegate.dart';
import '../../reusable_component/news_tab_bar.dart';
import '../../reusable_component/source_content.dart';

class BusinessNewsScreen extends StatelessWidget {
  const BusinessNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> sources = [
      'Bloomberg',
      'Financial Times',
      'Wall Street Journal',
      'Forbes',
      'Business Insider',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Business'),
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
            .map(
              (source) => SourceContent(source: source, category: 'Business'),
            )
            .toList(),
      ),
    );
  }
}

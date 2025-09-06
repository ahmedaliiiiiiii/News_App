import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../reusable_component/custom_search_delegate.dart';
import '../../reusable_component/news_tab_bar.dart';
import '../../reusable_component/source_content.dart';

class GeneralNewsScreen extends StatelessWidget {
  const GeneralNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> sources = [
      'BBC News',
      'CNN',
      'Reuters',
      'AP News',
      'Al Jazeera',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('General'),
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
            .map((source) => SourceContent(source: source, category: 'General'))
            .toList(),
      ),
    );
  }
}

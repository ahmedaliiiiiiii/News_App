import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../reusable_component/custom_app_bar.dart';
import '../../../reusable_component/news_tab_bar.dart';
import '../../../reusable_component/search/custom_search_delegate.dart';

class EntertainmentNewsScreen extends StatelessWidget {
  const EntertainmentNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Entertainment",
        showBackButton: true,
        onBackPressed: () => Navigator.pop(context),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: Icon(
              Icons.search,
              color: isDark
                  ? ColorManager.LightContrast
                  : ColorManager.DarkContrast,
            ),
          ),
        ],
      ),
      body: const NewsTabBar(category: "entertainment"),
    );
  }
}

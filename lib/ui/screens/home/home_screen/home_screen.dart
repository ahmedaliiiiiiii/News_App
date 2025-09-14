import 'package:flutter/material.dart';

import '../../../resources/caretory_model.dart';
import '../../../resources/color_manager.dart';
import '../../../reusable_component/app_drawer.dart';
import '../../../reusable_component/custom_app_bar.dart';
import '../../../reusable_component/search/custom_search_delegate.dart';
import 'home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedLanguage = 'English';
  final List<String> languageOptions = ['English', 'Arabic'];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() => _scaffoldKey.currentState?.openDrawer();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: "Home",
        showMenuIcon: true,
        onMenuPressed: _openDrawer,
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: CustomSearchDelegate()),
            icon: Icon(
              Icons.search,
              color: isDark
                  ? ColorManager.LightContrast
                  : ColorManager.DarkContrast,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(
        selectedLanguage: selectedLanguage,
        languageOptions: languageOptions,
        onLanguageChanged: (value) {
          setState(() => selectedLanguage = value);
        },
      ),
      body: HomeContent(categories: CategoryModel.all),
    );
  }
}

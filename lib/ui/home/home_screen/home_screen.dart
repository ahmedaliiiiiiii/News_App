import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../reusable_component/app_drawer.dart';
import '../../reusable_component/custom_app_bar.dart';
import '../../reusable_component/custom_search_delegate.dart';
import '../../reusable_component/home_content.dart';
import '../../reusable_component/news_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedTheme;
  String? selectedLanguage;

  final List<String> themeOptions = ['Light', 'Dark'];
  final List<String> languageOptions = ['English', 'Arabic'];

  final List<NewsCategory> categories = [
    NewsCategory(
      name: 'General',
      image: AssetManager.GeneralImage,
      stats: '169 Hug × 54 Hug',
    ),
    NewsCategory(
      name: 'Business',
      image: AssetManager.BusinessImage,
      stats: '203 Hug × 67 Hug',
    ),
    NewsCategory(
      name: 'Sports',
      image: AssetManager.SportImage,
      stats: '145 Hug × 42 Hug',
    ),
    NewsCategory(
      name: 'Technology',
      image: AssetManager.TechnologyImage,
      stats: '189 Hug × 61 Hug',
    ),
    NewsCategory(
      name: 'Entertainment',
      image: AssetManager.EntertainmentImage,
      stats: '176 Hug × 58 Hug',
    ),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    selectedTheme = themeOptions[0];
    selectedLanguage = languageOptions[0];
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // إضافة مفتاح للـ Scaffold
      appBar: CustomAppBar(
        title: "Home",
        showMenuIcon: true,
        onMenuPressed: _openDrawer,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search, color: ColorManager.DarkColor),
          ),
        ],
      ),
      drawer: AppDrawer(
        selectedTheme: selectedTheme,
        selectedLanguage: selectedLanguage,
        themeOptions: themeOptions,
        languageOptions: languageOptions,
        onThemeChanged: (value) {
          setState(() {
            selectedTheme = value;
          });
        },
        onLanguageChanged: (value) {
          setState(() {
            selectedLanguage = value;
          });
        },
      ),
      body: HomeContent(categories: categories),
    );
  }
}

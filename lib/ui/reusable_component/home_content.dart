import 'package:flutter/material.dart';

import '../home/categories/business_news_screen.dart';
import '../home/categories/entertainment_news_screen.dart';
import '../home/categories/general_news_screen.dart';
import '../home/categories/sports_news_screen.dart';
import '../home/categories/technology_news_screen.dart';
import '../resources/color_manager.dart';
import 'category_card.dart';
import 'news_category.dart';

class HomeContent extends StatelessWidget {
  final List<NewsCategory> categories;

  const HomeContent({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text(
            "Good Morning",
            style: TextStyle(
              color: ColorManager.DarkColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            "Here is Some News For You",
            style: TextStyle(
              color: ColorManager.DarkColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return CategoryCard(
                  categoryName: categories[index].name,
                  imagePath: categories[index].image,
                  stats: " ", // Fixed: Use actual stats
                  onPressed: () {
                    _navigateToCategory(context, categories[index].name);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToCategory(BuildContext context, String category) {
    switch (category.toLowerCase()) {
      case 'general':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GeneralNewsScreen()),
        );
        break;
      case 'business':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BusinessNewsScreen()),
        );
        break;
      case 'sports':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SportsNewsScreen()),
        );
        break;
      case 'technology':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TechnologyNewsScreen()),
        );
        break;
      case 'entertainment':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EntertainmentNewsScreen(),
          ),
        );
        break;
      default:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GeneralNewsScreen()),
        );
    }
  }
}

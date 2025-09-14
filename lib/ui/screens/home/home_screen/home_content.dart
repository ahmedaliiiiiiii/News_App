import 'package:flutter/material.dart';

import '../../../resources/caretory_model.dart';
import '../../../resources/color_manager.dart';
import '../../../widgets/category_widget.dart';
import '../categories/business_news_screen.dart';
import '../categories/entertainment_news_screen.dart';
import '../categories/general_news_screen.dart';
import '../categories/sports_news_screen.dart';
import '../categories/technology_news_screen.dart';

class HomeContent extends StatelessWidget {
  final List<CategoryModel> categories;

  const HomeContent({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            "Good Morning",
            style: TextStyle(
              color: isDark
                  ? ColorManager.LightContrast
                  : ColorManager.DarkContrast,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Here is Some News For You",
            style: TextStyle(
              color: isDark ? ColorManager.GreyLight : ColorManager.GreyMedium,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryWidget(
                  categoryName: category.name,
                  imagePath: category.imagePath,
                  stats: " ",
                  onPressed: () => _navigateToCategory(context, category),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToCategory(BuildContext context, CategoryModel category) {
    switch (category.id) {
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

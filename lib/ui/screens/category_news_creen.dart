import 'package:flutter/material.dart';
import 'package:news/ui/reusable_component/news_tab_bar.dart';

import '../resources/caretory_model.dart';

class CategoryNewsScreen extends StatelessWidget {
  final CategoryModel category; // ✅ بدل Category إلى CategoryModel

  const CategoryNewsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title as String)),
      body: NewsTabBar(category: category.id), // ✅ استخدم category.id
    );
  }
}

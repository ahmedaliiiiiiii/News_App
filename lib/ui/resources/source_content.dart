import 'package:flutter/material.dart';

class SourceContent extends StatelessWidget {
  final String source;
  final String category;

  const SourceContent({
    super.key,
    required this.source,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$source Content - $category'));
  }
}

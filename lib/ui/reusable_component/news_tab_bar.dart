import 'package:flutter/material.dart';
import 'package:news/ui/resources/color_manager.dart';

class NewsTabBar extends StatelessWidget {
  final List<String> tabNames;
  final List<Widget> tabViews;

  const NewsTabBar({super.key, required this.tabNames, required this.tabViews});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabNames.length,
      child: Column(
        children: [
          TabBar(
            enableFeedback: true,
            automaticIndicatorColorAdjustment: true,
            indicatorWeight: 3,
            labelPadding: EdgeInsets.symmetric(horizontal: 14),
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            mouseCursor: MouseCursor.uncontrolled,
            dividerHeight: 0,
            unselectedLabelColor: Colors.grey,
            tabAlignment: TabAlignment.start,
            indicatorColor: ColorManager.DarkColor,
            labelColor: ColorManager.DarkColor,
            isScrollable: true,
            tabs: tabNames.map((name) => Tab(text: name)).toList(),
          ),
          Expanded(child: TabBarView(children: tabViews)),
        ],
      ),
    );
  }
}

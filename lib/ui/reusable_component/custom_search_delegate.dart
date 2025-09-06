// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate() : super(searchFieldLabel: "Search for news...");

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Enter a search term to see results'));
    }

    return ListView(
      children: [
        for (int i = 1; i <= 3; i++)
          ListTile(
            title: Text('$query result $i'),
            subtitle: Text('Description for $query result $i'),
            onTap: () {
              close(context, '$query result $i');
            },
          ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = query.isEmpty
        ? ['Technology', 'Sports', 'Business', 'Entertainment']
        : ['$query news', '$query articles', '$query updates', '$query trends'];

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.LightColor,
        iconTheme: const IconThemeData(color: ColorManager.DarkColor),
        titleTextStyle: const TextStyle(
          color: ColorManager.DarkColor,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: ColorManager.DarkColor.withOpacity(0.6)),
        border: InputBorder.none,
      ),
    );
  }
}

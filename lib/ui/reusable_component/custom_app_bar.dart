import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onMenuPressed;
  final bool showMenuIcon;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = false,
    this.onMenuPressed,
    this.showMenuIcon = false,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDark
          ? ColorManager.DarkColor
          : ColorManager.LightColor,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: isDark ? ColorManager.LightContrast : ColorManager.DarkContrast,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDark
              ? ColorManager.LightContrast
              : ColorManager.DarkContrast,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      leading: _buildLeading(context),
      actions: actions,
    );
  }

  Widget? _buildLeading(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (showBackButton && onBackPressed != null) {
      return IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: isDark
              ? ColorManager.LightContrast
              : ColorManager.DarkContrast,
        ),
        onPressed: onBackPressed,
      );
    } else if (showMenuIcon && onMenuPressed != null) {
      return IconButton(
        icon: Icon(
          Icons.menu_outlined,
          color: isDark
              ? ColorManager.LightContrast
              : ColorManager.DarkContrast,
        ),
        onPressed: onMenuPressed,
      );
    }
    return null;
  }
}

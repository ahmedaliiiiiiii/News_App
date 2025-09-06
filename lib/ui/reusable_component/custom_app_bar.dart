import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onMenuPressed;
  final bool showMenuIcon;
  final VoidCallback? onBackPressed; // دالة جديدة للتحكم في زر الرجوع

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = false,
    this.onMenuPressed,
    this.showMenuIcon = false,
    this.onBackPressed, // معامل جديد
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.LightColor,
      iconTheme: const IconThemeData(color: ColorManager.DarkColor),
      title: Text(
        title,
        style: const TextStyle(
          color: ColorManager.DarkColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      leading: _buildLeading(context),
      actions: actions,
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (showBackButton && onBackPressed != null) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackPressed, // استخدام الدالة المخصصة
      );
    } else if (showMenuIcon && onMenuPressed != null) {
      return IconButton(
        icon: const Icon(Icons.menu_outlined),
        onPressed: onMenuPressed,
      );
    }
    return null;
  }
}

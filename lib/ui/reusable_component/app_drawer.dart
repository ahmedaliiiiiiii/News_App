// app_drawer.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/ui/resources/assets_manager.dart';
import 'package:news/ui/resources/color_manager.dart';
import 'package:provider/provider.dart';

import '../style/theme_manager.dart';

class AppDrawer extends StatelessWidget {
  final String? selectedLanguage;
  final List<String> languageOptions;
  final ValueChanged<String?> onLanguageChanged;

  const AppDrawer({
    super.key,
    required this.selectedLanguage,
    required this.languageOptions,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      elevation: 0,
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: isDark
                    ? ColorManager.DarkColor
                    : ColorManager.LightColor,
              ),
              child: Center(
                child: Text(
                  "News App",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? ColorManager.LightColor
                        : ColorManager.DarkColor,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: isDark
                    ? ColorManager.DarkColor
                    : ColorManager.LightColor,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerItem(
                      context,
                      iconPath: AssetManager.HomeIcon,
                      title: 'Go To Home',
                      onTap: () => Navigator.pop(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: isDark
                            ? ColorManager.LightColor.withOpacity(0.2)
                            : ColorManager.DarkColor.withOpacity(0.2),
                        thickness: 1,
                      ),
                    ),
                    // Theme Toggle Section
                    _buildThemeToggleSection(context, themeManager),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isDark ? ColorManager.LightColor : ColorManager.DarkColor,
          BlendMode.srcIn,
        ),
        height: 20,
        width: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: isDark ? ColorManager.LightColor : ColorManager.DarkColor,
          fontSize: 20,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildThemeToggleSection(
    BuildContext context,
    ThemeManager themeManager,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AssetManager.ThemeIcon,
                colorFilter: ColorFilter.mode(
                  isDark ? ColorManager.LightColor : ColorManager.DarkColor,
                  BlendMode.srcIn,
                ),
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 16),
              Text(
                'Theme',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? ColorManager.LightColor
                      : ColorManager.DarkColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  themeManager.isDarkMode ? 'Dark Mode' : 'Light Mode',
                  style: TextStyle(
                    color: isDark
                        ? ColorManager.LightColor
                        : ColorManager.DarkColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Switch(
                value: themeManager.isDarkMode,
                onChanged: (value) {
                  themeManager.toggleTheme();
                },
                activeColor: isDark
                    ? ColorManager.LightColor
                    : ColorManager.DarkColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

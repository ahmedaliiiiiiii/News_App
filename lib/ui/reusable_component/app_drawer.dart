// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class AppDrawer extends StatelessWidget {
  final String? selectedTheme;
  final String? selectedLanguage;
  final List<String> themeOptions;
  final List<String> languageOptions;
  final ValueChanged<String?> onThemeChanged;
  final ValueChanged<String?> onLanguageChanged;

  const AppDrawer({
    super.key,
    required this.selectedTheme,
    required this.selectedLanguage,
    required this.themeOptions,
    required this.languageOptions,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(color: ColorManager.LightColor),
              child: const Center(
                child: Text(
                  "News App",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: ColorManager.DarkColor,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: ColorManager.DarkColor,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerItem(
                      iconPath: AssetManager.HomeIcon,
                      title: 'Go To Home',
                      onTap: () => Navigator.pop(context),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: ColorManager.LightColor,
                        thickness: 2,
                      ),
                    ),
                    // Theme Section with Dropdown
                    _buildDropdownSection(
                      iconPath: AssetManager.ThemeIcon,
                      title: 'Theme',
                      value: selectedTheme,
                      options: themeOptions,
                      onChanged: onThemeChanged,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: ColorManager.LightColor,
                        thickness: 2,
                      ),
                    ),
                    // Language Section with Dropdown
                    _buildDropdownSection(
                      iconPath: AssetManager.LanguageIcon,
                      title: 'Language',
                      value: selectedLanguage,
                      options: languageOptions,
                      onChanged: onLanguageChanged,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        color: ColorManager.LightColor,
        height: 20,
        width: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w700,
          color: ColorManager.LightColor,
          fontSize: 20,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildDropdownSection({
    required String iconPath,
    required String title,
    required String? value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                iconPath,
                color: ColorManager.LightColor,
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  color: ColorManager.LightColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: ColorManager.DarkColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorManager.LightColor),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              dropdownColor: ColorManager.DarkColor,
              icon: Icon(Icons.arrow_drop_down, color: ColorManager.LightColor),
              underline: const SizedBox(),
              style: const TextStyle(
                color: ColorManager.LightColor,
                fontSize: 16,
              ),
              onChanged: onChanged,
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

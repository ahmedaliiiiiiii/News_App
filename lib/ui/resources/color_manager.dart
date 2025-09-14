// color_manager.dart
// ignore_for_file: constant_identifier_names

import 'dart:ui';

abstract final class ColorManager {
  // Core colors
  static const Color DarkColor = Color(0xff171717);
  static const Color LightColor = Color(0xffFFFFFF);

  // Enhanced contrast colors
  static const Color DarkContrast = Color(
    0xFF000000,
  ); // Pure black for better contrast
  static const Color LightContrast = Color(0xFFFFFFFF); // Pure white

  // Accent colors for better visual hierarchy
  static const Color AccentBlue = Color(0xFF1976D2);
  static const Color AccentRed = Color(0xFFD32F2F);

  // Grey scale for better text hierarchy
  static const Color GreyDark = Color(0xFF424242);
  static const Color GreyMedium = Color(0xFF757575);
  static const Color GreyLight = Color(0xFFBDBDBD);

  // Semantic colors
  static const Color Success = Color(0xFF388E3C);
  static const Color Warning = Color(0xFFF57C00);
  static const Color Error = Color(0xFFD32F2F);

  // Background variants
  static const Color DarkSurface = Color(0xFF2D2D2D);
  static const Color LightSurface = Color(0xFFF5F5F5);
}

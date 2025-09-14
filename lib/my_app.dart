// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/ui/resources/color_manager.dart';
import 'package:news/ui/screens/home/home_screen/home_screen.dart';
import 'package:news/ui/style/theme_manager.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return ScreenUtilInit(
            designSize: const Size(393, 852),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                theme: _buildLightTheme(),
                darkTheme: _buildDarkTheme(),
                themeMode: themeManager.themeMode,
                debugShowCheckedModeBanner: false,
                title: 'News',
                home: const HomeScreen(),
              );
            },
          );
        },
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorManager.DarkContrast,
      scaffoldBackgroundColor: ColorManager.LightColor,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.LightColor,
        foregroundColor: ColorManager.DarkContrast,
        elevation: 1,
        shadowColor: ColorManager.GreyLight.withOpacity(0.3),
        iconTheme: const IconThemeData(color: ColorManager.DarkContrast),
        titleTextStyle: const TextStyle(
          color: ColorManager.DarkContrast,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: ColorManager.LightColor,
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: ColorManager.GreyLight.withOpacity(0.5)),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: ColorManager.DarkContrast,
          height: 1.3,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: ColorManager.GreyDark,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: ColorManager.GreyDark,
          height: 1.4,
        ),
        bodySmall: TextStyle(fontSize: 12, color: ColorManager.GreyMedium),
        labelSmall: TextStyle(
          fontSize: 12,
          color: ColorManager.GreyMedium,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: const IconThemeData(color: ColorManager.DarkContrast),
      dividerTheme: DividerThemeData(
        color: ColorManager.GreyLight.withOpacity(0.8),
        thickness: 1,
        space: 1,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return ColorManager.DarkContrast;
          }
          return ColorManager.LightColor;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return ColorManager.DarkContrast.withOpacity(0.5);
          }
          return ColorManager.GreyLight;
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.DarkContrast,
          foregroundColor: ColorManager.LightColor,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorManager.LightContrast,
      scaffoldBackgroundColor: ColorManager.DarkColor,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.DarkColor,
        foregroundColor: ColorManager.LightContrast,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.5),
        iconTheme: const IconThemeData(color: ColorManager.LightContrast),
        titleTextStyle: const TextStyle(
          color: ColorManager.LightContrast,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: ColorManager.DarkSurface,
        elevation: 3,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: ColorManager.GreyDark.withOpacity(0.5)),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: ColorManager.LightContrast,
          height: 1.3,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: ColorManager.LightContrast,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: ColorManager.LightContrast.withOpacity(0.9),
          height: 1.4,
        ),
        bodySmall: TextStyle(fontSize: 12, color: ColorManager.GreyLight),
        labelSmall: TextStyle(
          fontSize: 12,
          color: ColorManager.GreyLight,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: const IconThemeData(color: ColorManager.LightContrast),
      dividerTheme: DividerThemeData(
        color: ColorManager.GreyDark.withOpacity(0.8),
        thickness: 1,
        space: 1,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return ColorManager.LightContrast;
          }
          return ColorManager.GreyLight;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return ColorManager.LightContrast.withOpacity(0.5);
          }
          return ColorManager.GreyDark;
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.LightContrast,
          foregroundColor: ColorManager.DarkContrast,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      // ... rest of dark theme
    );
  }
}

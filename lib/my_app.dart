import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/ui/home/home_screen/home_screen.dart';
import 'package:news/ui/resources/color_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: ColorManager.LightColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: ColorManager.LightColor,
              iconTheme: IconThemeData(color: ColorManager.DarkColor),
              titleTextStyle: TextStyle(
                color: ColorManager.DarkColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'News',
          home: HomeScreen(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'src/constants/app_colors.dart';
import 'src/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RZ Desarrollos Inmobiliarios',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark, // Enforcing dark mode as per design
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          surface: AppColors.surfaceDark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

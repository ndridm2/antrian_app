import 'package:antrian_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'core/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: AppColors.primary,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.primary
          ),
        ),
      ),
      home: const HomePage()
    );
  }
}

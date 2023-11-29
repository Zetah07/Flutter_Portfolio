import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:zetah_cv/utils/app_theme.dart';
import 'package:zetah_cv/view/main_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: AppTheme.lightTheme,
      builder: (p0, theme) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home:const MainView(),
      ),
    );
  }
}

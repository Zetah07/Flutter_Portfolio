import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:zetah_cv/utils/app_theme.dart';
import 'package:zetah_cv/view/first_view.dart';
import 'package:zetah_cv/view/second_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late PageController pageController;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  /// Create on Next Page Function
  void onNextPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    // For Making Responsive UI
    Size size = MediaQuery.of(context).size;

    var darkTheme = AppTheme.darkTheme;
    var lightTheme = AppTheme.lightTheme;

    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: isDarkMode 
          ? darkTheme.scaffoldBackgroundColor 
          : lightTheme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.vertical,
                  children: [
                    FirstView(onNextPage: () => onNextPage(1)),
                    SecondView(onNextPage: () => onNextPage(0)),
                  ],
                ),
              ),
              Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topLeft,
                child: ThemeSwitcher(
                  clipper: const ThemeSwitcherCircleClipper(),
                  builder: (context) {
                    return IconButton(
                      icon: Icon(
                        isDarkMode ? Icons.light_mode : Icons.dark_mode,
                        color: isDarkMode 
                          ? AppTheme.darkTheme.canvasColor 
                          : AppTheme.lightTheme.canvasColor,
                      ),
                      onPressed: () {
                        ThemeSwitcher.of(context).changeTheme(
                          theme: isDarkMode ? lightTheme : darkTheme,
                        );
                        setState(() {
                          isDarkMode = !isDarkMode;
                        });
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

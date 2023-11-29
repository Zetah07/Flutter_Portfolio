import 'package:flutter/material.dart';
import 'package:zetah_cv/utils/app_colors.dart';

class SkillBox extends StatelessWidget {
  const SkillBox({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
        // For Theme Data (Light/Dark)
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.primaryColor,
      ),
      child: Text (
        title,
        style: themeData.textTheme.displayMedium,
        ),
    );
  }
}
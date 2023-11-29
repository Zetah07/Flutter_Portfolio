import 'package:flutter/material.dart';
import 'package:zetah_cv/utils/app_colors.dart';

class SkillsProgress extends StatelessWidget {
  const SkillsProgress({
    super.key,
    required this.title,
    required this.progress,
  });

  final String title;
  final double progress;

  @override
  Widget build(BuildContext context) {

        // For Making Responsive UI
    Size size = MediaQuery.of(context).size;

    // For Theme Data (Light/Dark)
    ThemeData themeData = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.015,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
    
          /// Title
          Text(
            title,
            style: themeData.textTheme.displaySmall,
          ),
    
          /// Empty Space
          const SizedBox(height: 2),
    
          /// Progress Bar
          Center(
            child: SizedBox(
              width: size.width * 0.8,
              child: LinearProgressIndicator(
                color: AppColors.primaryColor,
                backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                value:progress,
                minHeight: size.height * 0.02,
                borderRadius: BorderRadius.circular(50),
                ),
            ),
          ),
        ],
      ),
    );
  }
}

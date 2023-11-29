import 'package:flutter/material.dart';
import 'package:zetah_cv/data/dev_data.dart';
import 'package:zetah_cv/utils/app_colors.dart';
import 'package:zetah_cv/utils/app_strings.dart';
import 'package:zetah_cv/widget/skills_box.dart';
import 'package:zetah_cv/widget/skills_progress.dart';

class FirstView extends StatelessWidget {
  const FirstView({
    super.key,
    required this.onNextPage,
  });

  final VoidCallback onNextPage;

  @override
  Widget build(BuildContext context) {

        // For Making Responsive UI
    Size size = MediaQuery.of(context).size;

    // For Theme Data (Light/Dark)
    ThemeData themeData = Theme.of(context);

    return Column(
      children: [
        /// Empty Space
        SizedBox(height: size.height * 0.01),

        /// Developer Avatar
        Container(
          padding: EdgeInsets.all(size.height * 0.01),
          decoration: BoxDecoration(
            color: themeData.cardColor,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: size.height * 0.15,
            backgroundColor: AppColors.primaryColor,
            backgroundImage: Image.asset(AppStrings.profileImageUrl).image,
          ),
        ),

        /// Empty Space
        SizedBox(height: size.height * 0.01),

        /// Developer Name
        Text(DevData.devData.name, 
          style:themeData.textTheme.displayLarge,
),

        /// Empty Space
        SizedBox(height: size.height * 0.01),

        /// Developer skills
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: size.width * 0.04,
          runSpacing: size.height * 0.02,
          children: List.generate(
            DevData.devData.skillsAndProgress.length,
            (index) => SkillBox(
              title: DevData.devData.skillsAndProgress[index].name,
            ),
          ),
        ),

        /// Empty Space
        SizedBox(height: size.height * 0.01),

        /// skills progress
        Column(
          children: [
            ...List.generate(
              DevData.devData.skillsAndProgress.length,
              (index) => SkillsProgress(
                title: DevData.devData.skillsAndProgress[index].name,
                progress: DevData.devData.skillsAndProgress[index].progress,
                ),
            ),
          ],
        ),
      

      Expanded(child: Container()),

      IconButton(
        color: themeData.canvasColor,
        onPressed:onNextPage, 
        icon: const Icon( Icons.arrow_downward_outlined)),
      
      SizedBox(height: size.height * 0.05)
      ],
    );
  }
}


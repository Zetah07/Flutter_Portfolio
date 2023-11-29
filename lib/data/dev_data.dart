import 'package:zetah_cv/models/dev_model.dart';

/// custom class for storing developer data locally

class DevData {
  DevData._();

  static DevModel devData = DevModel(
    name: 'Zetah Dev', 
    number: '573186110790', 
    email: 'jszetah@gmail.com',
    github: 'Zetah07',
    bio: devBio, 
    hobbies: <String> [
      'Learning about Development',
      'Create new projects',
      'Play videogames',
    ], 
    skillsAndProgress: <SkillsAndProgress> [
      SkillsAndProgress(
        name: 'Software Engineer', 
        progress: 0.6,
      ),

      SkillsAndProgress(
        name: 'Mobile Developer', 
        progress: 0.8,
      ),

      SkillsAndProgress(
        name: 'Web Developer', 
        progress: 0.7,
      ),

      SkillsAndProgress(
        name: 'UI/UX Designer', 
        progress: 0.6,
      ),
    ]
  );

static const String devBio = " I am a software developer with experience in web and mobile development,  FlexZ, a motivated software engineering student with a passion for mobile development using Dart and Flutter 📱. Check out my portfolio.  Let's explore mobile development together! 🚀 ";

}

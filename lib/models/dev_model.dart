/// Developer model class

class DevModel {
  final String name;
  final String number;
  final String email;
  final String github;
  final String bio;
  final List<String> hobbies;
  final List<SkillsAndProgress> skillsAndProgress;

  DevModel({
    required this.name, 
    required this.number, 
    required this.email,
    required this.github,
    required this.bio, 
    required this.hobbies, 
    required this.skillsAndProgress,
  });
}

/// Skills and progress

class SkillsAndProgress {
  final String name;
  final double progress;

  SkillsAndProgress({
    required this.name, 
    required this.progress,
  });
}
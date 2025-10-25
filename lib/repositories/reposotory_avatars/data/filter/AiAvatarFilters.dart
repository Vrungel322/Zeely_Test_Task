part of repository_avatars;

class AiAvatarFilters {
  final List<AiAvatarGender> genders;
  final List<AiAvatarAgeGroup> ageGroups;
  final List<AiAvatarPose> poses;

  AiAvatarFilters({required this.genders, required this.ageGroups, required this.poses});

  factory AiAvatarFilters.initial(){
    return AiAvatarFilters(genders: [], ageGroups: [], poses: []);
  }

  bool isEmpty() {
    return genders.isEmpty && ageGroups.isEmpty && poses.isEmpty;
  }

  AiAvatarFilters copyWith({
    List<AiAvatarGender>? genders,
    List<AiAvatarAgeGroup>? ageGroups,
    List<AiAvatarPose>? poses,
  }) {
    return AiAvatarFilters(
      genders: genders ?? this.genders,
      ageGroups: ageGroups ?? this.ageGroups,
      poses: poses ?? this.poses,
    );
  }
}

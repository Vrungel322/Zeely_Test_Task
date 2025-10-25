part of screen_avatars;

sealed class _AvatarFilterConfigurationUiData {
  final String title;
  final String buttonTitle;
  final List<_AvatarFilterConfigurationItemUiData> filterOptions;

  _AvatarFilterConfigurationUiData({required this.title, required this.buttonTitle, required this.filterOptions});
}

class _AvatarFilterConfigurationGenderUiData extends _AvatarFilterConfigurationUiData {
  _AvatarFilterConfigurationGenderUiData({required List<_AvatarFilterConfigurationGenderItemUiData> filterOptions})
    : super(title: 'Gender', buttonTitle: 'Save', filterOptions: filterOptions);

  factory _AvatarFilterConfigurationGenderUiData.buildFromFiltersList(List<AiAvatarGender> genders) {
    final filterOptions =
        AiAvatarGender.values.map((gender) {
          final title = switch (gender) {
            AiAvatarGender.male => 'Men',
            AiAvatarGender.female => 'Women',
          };
          return _AvatarFilterConfigurationGenderItemUiData(
            isSelected: genders.contains(gender),
            title: title,
            option: gender,
          );
        }).toList();
    return _AvatarFilterConfigurationGenderUiData(filterOptions: filterOptions);
  }
}

class _AvatarFilterConfigurationAgeUiData extends _AvatarFilterConfigurationUiData {
  _AvatarFilterConfigurationAgeUiData({required List<_AvatarFilterConfigurationAgeItemUiData> filterOptions})
    : super(title: 'Age', buttonTitle: 'Save', filterOptions: filterOptions);

  factory _AvatarFilterConfigurationAgeUiData.buildFromFiltersList(List<AiAvatarAgeGroup> ageGroups) {
    final filterOptions =
        AiAvatarAgeGroup.values.map((ageGroup) {
          final (title, subTitle) = switch (ageGroup) {
            AiAvatarAgeGroup.youngAdults => ('Young adults', '18–24'),
            AiAvatarAgeGroup.adults => ('Adults', '25–39'),
            AiAvatarAgeGroup.midAgeAdults => ('Middle-aged adults', '40–64'),
            AiAvatarAgeGroup.olderAdults => ('Older adults', '65+'),
          };

          return _AvatarFilterConfigurationAgeItemUiData(
            isSelected: ageGroups.contains(ageGroup),
            option: ageGroup,
            title: title,
            subTitle: subTitle,
          );
        }).toList();
    return _AvatarFilterConfigurationAgeUiData(filterOptions: filterOptions);
  }
}

class _AvatarFilterConfigurationPoseUiData extends _AvatarFilterConfigurationUiData {
  _AvatarFilterConfigurationPoseUiData({required List<_AvatarFilterConfigurationPoseItemUiData> filterOptions})
    : super(title: 'Pose', buttonTitle: 'Save', filterOptions: filterOptions);

  factory _AvatarFilterConfigurationPoseUiData.buildFromFiltersList(List<AiAvatarPose> poses) {
    final filterOptions =
        AiAvatarPose.values.map((pose) {
          final title = switch (pose) {
            AiAvatarPose.standing => 'Standing',
            AiAvatarPose.sitting => 'Sitting',
            AiAvatarPose.selfie => 'Selfie',
            AiAvatarPose.carSelfie => 'Car selfie',
            AiAvatarPose.walking => 'Walking',
          };

          return _AvatarFilterConfigurationPoseItemUiData(isSelected: poses.contains(pose), option: pose, title: title);
        }).toList();
    return _AvatarFilterConfigurationPoseUiData(filterOptions: filterOptions);
  }
}

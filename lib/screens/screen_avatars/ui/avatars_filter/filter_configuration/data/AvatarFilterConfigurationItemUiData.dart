part of screen_avatars;

sealed class _AvatarFilterConfigurationItemUiData<T> {
  final bool isSelected;
  final String title;
  final String? subTitle;

  /// Can be one of AiAvatarGender, AiAvatarAgeGroup, AiAvatarPose only
  final T option;

  _AvatarFilterConfigurationItemUiData({
    required this.isSelected,
    required this.title,
    this.subTitle,
    required this.option,
  });

  _AvatarFilterConfigurationItemUiData toggleSelection();
}

class _AvatarFilterConfigurationGenderItemUiData extends _AvatarFilterConfigurationItemUiData<AiAvatarGender> {
  _AvatarFilterConfigurationGenderItemUiData({required super.isSelected, required super.title, required super.option});

  @override
  _AvatarFilterConfigurationItemUiData toggleSelection() {
    return _AvatarFilterConfigurationGenderItemUiData(isSelected: !isSelected, title: title, option: option);
  }
}

class _AvatarFilterConfigurationPoseItemUiData extends _AvatarFilterConfigurationItemUiData<AiAvatarPose> {
  _AvatarFilterConfigurationPoseItemUiData({required super.isSelected, required super.title, required super.option});

  @override
  _AvatarFilterConfigurationItemUiData toggleSelection() {
    return _AvatarFilterConfigurationPoseItemUiData(isSelected: !isSelected, title: title, option: option);
  }
}

class _AvatarFilterConfigurationAgeItemUiData extends _AvatarFilterConfigurationItemUiData<AiAvatarAgeGroup> {
  _AvatarFilterConfigurationAgeItemUiData({
    required super.isSelected,
    required super.title,
    required super.option,
    required super.subTitle,
  });

  @override
  _AvatarFilterConfigurationItemUiData toggleSelection() {
    return _AvatarFilterConfigurationAgeItemUiData(
      isSelected: !isSelected,
      title: title,
      option: option,
      subTitle: subTitle,
    );
  }
}

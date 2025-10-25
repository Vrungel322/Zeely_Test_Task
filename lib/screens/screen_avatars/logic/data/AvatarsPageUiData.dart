part of screen_avatars;

/// This class is some kind of state of [AvatarsPage]
class _AvatarsPageUiData {
  final AiAvatarFilters filters;
  final List<_AiAvatarUiData> avatars;
  final _AvatarFilterConfigurationUiData? filterConfigurationUiData;

  _AvatarsPageUiData({required this.filters, required this.avatars, required this.filterConfigurationUiData});

  factory _AvatarsPageUiData.initial() {
    return _AvatarsPageUiData(filters: AiAvatarFilters.initial(), avatars: [], filterConfigurationUiData: null);
  }

  _AvatarsPageUiData copyWith({
    AiAvatarFilters? filters,
    List<_AiAvatarUiData>? avatars,
    _AvatarFilterConfigurationUiData? filterConfigurationUiData,
  }) {
    return _AvatarsPageUiData(
      filters: filters ?? this.filters,
      avatars: avatars ?? this.avatars,
      filterConfigurationUiData: filterConfigurationUiData ?? this.filterConfigurationUiData,
    );
  }

  _AvatarsPageUiData clearFilterConfigurationUiData() {
    return _AvatarsPageUiData(
      filters: filters,
      avatars: avatars,
      filterConfigurationUiData: null,
    );
  }
}

part of screen_avatars;

class _AvatarsController extends GetxController {
  final _AiAvatarsInteractor _interactor;

  _AvatarsController(this._interactor);

  _AvatarsPageUiData _uiData = _AvatarsPageUiData.initial();

  _AvatarsPageUiData get uiData => _uiData;

  @override
  void onReady() {
    loadAvatars();
    super.onReady();
  }

  loadAvatars() async {
    final avatarLocals = await _interactor.getAvatar(filters: _uiData.filters);
    final avatarUiItems = avatarLocals.map((item) => _AiAvatarUiData.fromLocal(item)).toList();
    _uiData = _uiData.copyWith(avatars: avatarUiItems);
    update();
  }

  filterAvatars(List<_AvatarFilterConfigurationItemUiData> uiFilterData) {
    AiAvatarFilters updatedFilters = uiData.filters;
    switch (uiData.filterConfigurationUiData) {
      case _AvatarFilterConfigurationGenderUiData():
        {
          final castedItems = uiFilterData.cast<_AvatarFilterConfigurationGenderItemUiData>();
          final genders = castedItems.where((item) => item.isSelected).map((item) => item.option).toList();
          updatedFilters = _uiData.filters.copyWith(genders: genders);
        }
      case _AvatarFilterConfigurationAgeUiData():
        {
          final castedItems = uiFilterData.cast<_AvatarFilterConfigurationAgeItemUiData>();
          final ageGroups = castedItems.where((item) => item.isSelected).map((item) => item.option).toList();
          updatedFilters = _uiData.filters.copyWith(ageGroups: ageGroups);
        }
      case _AvatarFilterConfigurationPoseUiData():
        {
          final castedItems = uiFilterData.cast<_AvatarFilterConfigurationPoseItemUiData>();
          final poses = castedItems.where((item) => item.isSelected).map((item) => item.option).toList();
          updatedFilters = _uiData.filters.copyWith(poses: poses);
        }
      case null:
      //     do nothing
    }
    _uiData = _uiData.copyWith(filters: updatedFilters).clearFilterConfigurationUiData();
    loadAvatars();
  }

  startEditGenderFilters() {
    _uiData = _uiData.copyWith(
      filterConfigurationUiData: _AvatarFilterConfigurationGenderUiData.buildFromFiltersList(uiData.filters.genders),
    );
    update();
  }

  startEditAgeFilters() {
    _uiData = _uiData.copyWith(
      filterConfigurationUiData: _AvatarFilterConfigurationAgeUiData.buildFromFiltersList(uiData.filters.ageGroups),
    );
    update();
  }

  startEditPoseFilters() {
    _uiData = _uiData.copyWith(
      filterConfigurationUiData: _AvatarFilterConfigurationPoseUiData.buildFromFiltersList(uiData.filters.poses),
    );
    update();
  }

  resetFilters() {
    _uiData = _uiData.copyWith(filters: AiAvatarFilters.initial()).clearFilterConfigurationUiData();
    update();
    loadAvatars();
  }

  stopEditFilters() {
    _uiData = _uiData.clearFilterConfigurationUiData();
    update();
  }
}

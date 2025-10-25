part of repository_avatars;

/// Note: This repo NOT take into account pagination for simplicity, because of test task purpose.
class AvatarRepository {
  final AvatarStorage _storage;

  AvatarRepository(this._storage);

  Future<List<AiAvatarLocal>> getAvatar({bool force = false, AiAvatarFilters? filters}) async {
    if (force) {
      final avatarsFromApi = await _getAllAvatarsFromApi(filters);
      await _storage.setAvatars(avatarsFromApi);
      return avatarsFromApi;
    } else {
      final avatarsFromStorage = await _storage.getAvatars(filters: filters);
      return avatarsFromStorage.isEmpty && (filters == null || filters?.isEmpty() == true)
          ? await getAvatar(force: true, filters: filters)
          : avatarsFromStorage;
    }
  }

  /// Simulate API call to fetch all avatars with optional filtering
  Future<List<AiAvatarLocal>> _getAllAvatarsFromApi(AiAvatarFilters? filters) async {
    // simulate api call
    await Future.delayed(const Duration(milliseconds: 160));
    // simulate fetching models from api and map to AiAvatarLocal
    return List.generate(30, (i) => AiAvatarLocal.buildStub(i))
        .where((item) {
          return item.ageGroup != AiAvatarAgeGroup.youngAdults;
        })
        .where((item) {
          if (filters == null) {
            return true;
          } else {
            final genderMatch = filters.genders.isEmpty ? true : filters.genders.contains(item.gender);
            final ageGroupMatch = filters.ageGroups.isEmpty ? true : filters.ageGroups.contains(item.ageGroup);
            final poseMatch = filters.poses.isEmpty ? true : filters.poses.contains(item.pose);
            return genderMatch && ageGroupMatch && poseMatch;
          }
        })
        .toList();
  }
}

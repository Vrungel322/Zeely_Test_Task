part of repository_avatars;

class _AvatarStorageRuntimeImpl implements AvatarStorage {
  final List<AiAvatarLocal> _avatars = [];

  @override
  Future<List<AiAvatarLocal>> getAvatars({AiAvatarFilters? filters}) async {
    return _avatars.where((a) {
      if (filters == null) {
        return true;
      } else {
        final genderMatch = filters.genders .isEmpty ? true : filters.genders.contains( a.gender);
        final ageGroupMatch = filters.ageGroups .isEmpty ? true : filters.ageGroups.contains( a.ageGroup);
        final poseMatch = filters.poses .isEmpty ? true : filters.poses.contains( a.pose);
        return genderMatch && ageGroupMatch && poseMatch;
      }
    }).toList();
  }

  @override
  Future setAvatars(List<AiAvatarLocal> avatars) async {
    _avatars.clear();
    _avatars.addAll(avatars);
  }
}

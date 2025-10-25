part of repository_avatars;

abstract interface class AvatarStorage {
  Future setAvatars(List<AiAvatarLocal> avatars);

  Future<List<AiAvatarLocal>> getAvatars({AiAvatarFilters? filters});
}

part of repository_avatars;

class RepositoryAvatarsModule {
  static initDi() {
    Get.put(AvatarRepository(_AvatarStorageRuntimeImpl()));
  }
}

part of screen_avatars;

class ScreenAvatarsModule {
  static initDi() {
    Get.put(_AvatarsController(_AiAvatarsInteractor(Get.find<AvatarRepository>())));
  }
}

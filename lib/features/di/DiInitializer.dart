part of feature_di;

class DiInitializer {
  DiInitializer._();

  static initDi() {
    // order matters
    RepositoryAvatarsModule.initDi();
    ScreenAvatarsModule.initDi();
  }
}

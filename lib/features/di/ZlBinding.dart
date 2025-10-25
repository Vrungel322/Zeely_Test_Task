part of feature_di;

class ZlBinding extends Bindings {
  @override
  void dependencies() {
    DiInitializer.initDi();
  }
}

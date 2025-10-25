part of screen_avatars;

/// Some kind of "use-case"
class _AiAvatarsInteractor {
  final AvatarRepository _repository;

  _AiAvatarsInteractor(this._repository);

  Future<List<AiAvatarLocal>> getAvatar({bool force = false, AiAvatarFilters? filters}) {
    return _repository.getAvatar(force: force, filters: filters);
  }
}

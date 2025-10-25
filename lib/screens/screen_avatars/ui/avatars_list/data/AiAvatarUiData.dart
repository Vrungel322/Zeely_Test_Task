part of screen_avatars;

class _AiAvatarUiData {
  final String id;
  final String imageUrl;
  final String displayName;
  final String displayAge;
  final String displayGender;

  _AiAvatarUiData({
    required this.id,
    required this.imageUrl,
    required this.displayName,
    required this.displayAge,
    required this.displayGender,
  });

  factory _AiAvatarUiData.fromLocal(AiAvatarLocal local) {
    final displayGender = switch (local.gender) {
      AiAvatarGender.male => 'Male',
      AiAvatarGender.female => 'Female',
    };
    return _AiAvatarUiData(
      id: local.id,
      imageUrl: local.imageUrl,
      displayName: local.name,
      displayAge: '${local.age}',
      displayGender: displayGender,
    );
  }
}

part of repository_avatars;

class AiAvatarLocal {
  final String id;
  final String imageUrl;
  final String name;
  final int age;
  final AiAvatarAgeGroup ageGroup;
  final AiAvatarGender gender;
  final AiAvatarPose pose;

  AiAvatarLocal({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.age,
    required this.ageGroup,
    required this.gender,
    required this.pose,
  });

  factory AiAvatarLocal.buildStub(int index) {
    final pose = AiAvatarPose.values[index % AiAvatarPose.values.length];
    final gender = AiAvatarGender.values[index % AiAvatarGender.values.length];
    final ageGroup = AiAvatarAgeGroup.values[index % AiAvatarAgeGroup.values.length];
    final age = switch (ageGroup) {
      AiAvatarAgeGroup.youngAdults => 18,
      AiAvatarAgeGroup.adults => 25,
      AiAvatarAgeGroup.midAgeAdults => 40,
      AiAvatarAgeGroup.olderAdults => 65,
    };
    final name = gender == AiAvatarGender.female ? 'Jane$index' : 'John$index';
    return AiAvatarLocal(
      id: '$index',
      imageUrl: 'https://picsum.photos/160/120?random=$index',
      name: name,
      age: age,
      ageGroup: ageGroup,
      pose: pose,
      gender: gender,
    );
  }
}

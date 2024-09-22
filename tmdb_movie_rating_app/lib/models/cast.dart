class Cast {
  final String originalName;
  final String characterName;
  final String profilePicture;

  Cast({
    required this.originalName,
    required this.characterName,
    required this.profilePicture,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Cast(
      originalName: json['name'] as String,
      characterName: json['character'] as String,
      profilePicture: json['profile_path'] != null
          ? '$baseUrl${json['profile_path']}'
          : '',
    );
  }
}

class ProfileData {
  final String name;
  final String email;
  final String? profilePicUrl;
  final String bio;

  ProfileData({
    required this.name,
    required this.email,
    this.profilePicUrl,
    required this.bio,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profilePicUrl: json['profile_pic_url'],
      bio: json['bio'] ?? '',
    );
  }
}
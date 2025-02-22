import '../models/profile_data_model.dart';

class MockProfileService {
  static Future<ProfileData> getMockProfileData() async {
    await Future.delayed(const Duration(seconds: 2));
    
    return ProfileData(
      name: "Sarah Wilson",
      email: "sarah@weave.com",
      bio: "Senior Developer\nOpen Source Contributor\nMobile App Specialist",
      profilePicUrl: null, 
    );
  }
}

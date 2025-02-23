import 'package:flutter/material.dart';
import 'package:weave_app/custom_widgets/background.dart';
import 'package:weave_app/custom_widgets/customButton.dart';
import 'package:weave_app/backend/models/profile_data_model.dart';
import 'package:weave_app/backend/services/profile_data_model.dart';
import 'package:weave_app/custom_widgets/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileData? _profileData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    try {
      final profileData = await MockProfileService.getMockProfileData();
      setState(() {
        _profileData = profileData;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to load profile data'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Background(
            boxPaddingHorizontal: screenWidth * 0.1,
            boxPaddingVertical: screenHeight * 0.25,
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _buildProfileContent(context),
        ],
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildProfilePicture(),
          _buildProfileInfo(),
        ],
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xff101426),
            child: _profileData?.profilePicUrl != null
                ? ClipOval(
                    child: Image.network(
                      _profileData!.profilePicUrl!,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Image(
                    image: AssetImage('assets/icons/profile_picture.png'),
                    width: 120,
                    height: 120)),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xff101426),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    _profileData?.name ?? '',
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 60,
                    margin: const EdgeInsets.only(top: 4),
                    color: primaryColor.withOpacity(0.3),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Text(
                    _profileData?.email ?? '',
                    style: TextStyle(
                      color: primaryColor.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 40,
                    margin: const EdgeInsets.only(top: 4),
                    color: primaryColor.withOpacity(0.3),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  Text(
                    _profileData?.bio ?? '',
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 2,
                    width: 80,
                    margin: const EdgeInsets.only(top: 8),
                    color: primaryColor.withOpacity(0.3),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              CustomButton(
                text: 'Logout',
                onPressed: () {},
                color: primaryColor,
                widthFactor: 0.4,
              )
            ],
          ),
        ),
      ),
    );
  }
}

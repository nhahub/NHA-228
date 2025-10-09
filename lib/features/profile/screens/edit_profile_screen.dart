import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';
import 'package:nha_228/features/profile/widgets/gender_drop_down_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? gender = 'Female';
  final List<String> genderList = ['Female', 'Male'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppValues.w18),
            child: Column(
              children: [
                CircleAvatar(
                  radius: AppValues.r50,
                  backgroundImage: AssetImage(AppAssets.profile),
                ),
                CustomTextField(hintText: AppStrings.firstName),
                CustomTextField(hintText:  AppStrings.lastName),
                CustomTextField(hintText:  AppStrings.email),
                CustomTextField(hintText:  AppStrings.phone),
                GenderDropdownField(),
        
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

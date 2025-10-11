import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/core/widgets/custom_app_bar.dart';
import 'package:nha_228/core/widgets/custom_botton.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';
import 'package:nha_228/features/profile/widgets/date_picker_field.dart';
import 'package:nha_228/features/profile/widgets/gender_drop_down_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.editProfile),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppValues.w18),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: AppValues.r50,
                        backgroundImage:
                            imagePath == null
                                ? AssetImage(AppAssets.profile)
                                : FileImage(File(imagePath!)),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            showImageSourceDialog(context, (XFile file) {
                              setState(() {
                                imagePath = file.path;
                              });
                            });
                          },
                          child: Container(
                            width: AppValues.w25,
                            height: AppValues.h25,
                            decoration: BoxDecoration(
                              color: AppColors.camerabackground,
                              borderRadius: BorderRadius.circular(AppValues.r40),
                            ),
                            child: Center(child: SvgPicture.asset(AppAssets.camera)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(hintText: AppStrings.firstName),
                  CustomTextField(hintText: AppStrings.lastName),
                  CustomTextField(hintText: AppStrings.email),
                  CustomTextField(hintText: AppStrings.phone),
                  GenderDropdownField(),
                  DatePickerField(),
                  SizedBox(height: AppValues.h20),
                  CustomButton(title: AppStrings.save, onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showImageSourceDialog(BuildContext context, Function(XFile) selectedFile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppValues.r18)),
          child: Padding(
            padding:  EdgeInsets.all(AppValues.w20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.chooseImage,
                  style:Theme.of(context).textTheme.displayMedium,
                ),
                 SizedBox(height: AppValues.h20),

                ListTile(
                  leading: Icon(Icons.camera_alt, color: AppColors.blue,),
                  title: Text(AppStrings.camera),
                  onTap: () async {
                    Navigator.pop(context);
                    final image = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                    );
                    if (image != null) selectedFile(image);
                  },
                ),
                const Divider(),

                ListTile(
                  leading: Icon(Icons.photo_library, color:AppColors.success),
                  title: Text(AppStrings.gallery),
                  onTap: () async {
                    Navigator.pop(context);
                    final image = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image != null) selectedFile(image);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

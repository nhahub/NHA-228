import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/widgets/custom_app_bar.dart';
import 'package:nha_228/core/widgets/custom_botton.dart';
import 'package:nha_228/features/auth/models/user_model.dart';
import 'package:nha_228/features/auth/widgets/custom_text_filed.dart';
import 'package:nha_228/features/profile/cubit/profile_cubit.dart';
import 'package:nha_228/features/profile/widgets/date_picker_field.dart';
import 'package:nha_228/features/profile/widgets/gender_drop_down_field.dart';

class EditProfileScreen extends StatefulWidget {
  final ProfileCubit profileCubit;
  const EditProfileScreen({super.key, required this.profileCubit});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? imagePath;
  UserModel? userModel;
  String? selectedGender;
  DateTime? selectedDate;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.profileCubit,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded || state is ProfileUpdated) {
            userModel = (state as dynamic).userModel;

            firstNameController.text = userModel?.firstName ?? '';
            lastNameController.text = userModel?.lastName ?? '';
            emailController.text = userModel?.email ?? '';
            phoneController.text = userModel?.phone ?? '';
            imagePath ??= userModel?.photoUrl;
            selectedGender = userModel?.gender;
            selectedDate = userModel?.dateOfBirth;

            return Scaffold(
              appBar: CustomAppBar(title: AppStrings.editProfile),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.w18),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: AppSizes.r50,
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
                                width: AppSizes.w24,
                                height: AppSizes.h24,
                                decoration: BoxDecoration(
                                  color: AppColors.cameraBackground,
                                  borderRadius: BorderRadius.circular(AppSizes.r40),
                                ),
                                child: Center(child: SvgPicture.asset(AppAssets.camera)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        hintText: AppStrings.firstName,
                        controller: firstNameController,
                      ),
                      CustomTextField(
                        hintText: AppStrings.lastName,
                        controller: lastNameController,
                      ),
                      CustomTextField(
                        readOnly: true,
                        hintText: AppStrings.email,
                        controller: emailController,
                      ),
                      CustomTextField(
                        hintText: AppStrings.phone,
                        controller: phoneController,
                      ),
                      GenderDropdownField(
                        initialValue: selectedGender,
                        onChanged: (value) => selectedGender = value,
                      ),
                      DatePickerField(
                        initialDate: userModel?.dateOfBirth,
                        onDateSelected: (value) => selectedDate = value,
                      ),
                      SizedBox(height: AppSizes.h20),
                      CustomButton(
                        title: AppStrings.save,
                        onPressed: () async {
                          UserModel updatedUser = UserModel(
                            uid: userModel?.uid ?? '',
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            photoUrl: imagePath,
                            gender: selectedGender,
                            dateOfBirth: selectedDate,
                          );

                          await context.read<ProfileCubit>().updateUserProfile(
                            updatedUser,
                          );
                          if (context.mounted) context.pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

void showImageSourceDialog(BuildContext context, Function(XFile) selectedFile) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r18)),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.w20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.chooseImage,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: AppSizes.h20),
              ListTile(
                leading: Icon(Icons.camera_alt, color: AppColors.blue),
                title: Text(AppStrings.camera),
                onTap: () async {
                  Navigator.pop(context);
                  final image = await ImagePicker().pickImage(source: ImageSource.camera);
                  if (image != null) selectedFile(image);
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.photo_library, color: AppColors.success),
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/services/hive_service.dart';
import 'package:nha_228/core/utils/app_routers.dart';
import 'package:nha_228/core/widgets/custom_app_bar.dart';
import 'package:nha_228/features/auth/models/user_model.dart';
import 'package:nha_228/features/profile/widgets/data_info_filed.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    userModel = HiveManager().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.profile),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.w18),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: AppSizes.r50,
                    backgroundImage:
                        userModel?.photoUrl == null
                            ? AssetImage(AppAssets.profile)
                            : FileImage(File(userModel!.photoUrl!)) as ImageProvider,
                  ),
                  SizedBox(height: AppSizes.h60),
                  DataInfoFiled(data: '${userModel?.firstName} ${userModel?.lastName}'),
                  SizedBox(height: AppSizes.h20),
                  DataInfoFiled(data: userModel?.email ?? ''),
                  SizedBox(height: AppSizes.h20),
                  DataInfoFiled(data: userModel?.phone ?? ''),
                  SizedBox(height: AppSizes.h20),
                  DataInfoFiled(data: userModel?.gender ?? ' '),
                  DataInfoFiled(
                    data:
                        userModel?.dateOfBirth != null
                            ? DateFormat('dd/MM/yyyy').format(userModel!.dateOfBirth!)
                            : '',
                  ),

                  Center(
                    child: InkWell(
                      onTap: () {
                        context.push(AppRouter.editProfileScreen);
                      },
                      child: const Text(AppStrings.editProfile),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

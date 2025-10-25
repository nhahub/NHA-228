import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nha_228/core/constants/app_assets.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/utils/app_routers.dart';
import 'package:nha_228/features/profile/utils/image_helper.dart';
import 'package:nha_228/features/profile/cubit/profile_cubit.dart';
import 'package:nha_228/features/profile/widgets/custom_elevated_button.dart';
import 'package:nha_228/features/profile/widgets/data_info_filed.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..loadUser(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoggedOut) {
            context.go(AppRouter.loginScreen);
          }
        },
        builder: (context, state) {
          final userModel =
              (state is ProfileLoaded || state is ProfileUpdated)
                  ? (state as dynamic).userModel
                  : null;

          if (userModel == null) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppStrings.profile,
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              actions: [
                Padding(
                  padding: EdgeInsets.only(right: AppSizes.w16),
                  child: Container(
                    width: AppSizes.w30,
                    height: AppSizes.h30,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppAssets.edit,
                        width: AppSizes.w20,
                        height: AppSizes.h20,
                      ),
                      onPressed: () {
                        context.push(
                          AppRouter.editProfileScreen,
                          extra: context.read<ProfileCubit>(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.w18),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: AppSizes.r50,
                      backgroundImage: getUserImage(userModel.photoUrl),
                    ),

                    SizedBox(height: AppSizes.h60),

                    DataInfoFiled(
                      data: '${userModel.firstName ?? ''} ${userModel.lastName ?? ''}',
                    ),
                    SizedBox(height: AppSizes.h20),
                    DataInfoFiled(data: userModel.email ?? ''),
                    SizedBox(height: AppSizes.h20),
                    DataInfoFiled(data: userModel.phone ?? ''),
                    SizedBox(height: AppSizes.h20),
                    DataInfoFiled(data: userModel.gender ?? ''),
                    SizedBox(height: AppSizes.h20),
                    DataInfoFiled(
                      data:
                          userModel.dateOfBirth != null
                              ? DateFormat('dd/MM/yyyy').format(userModel.dateOfBirth!)
                              : '',
                    ),

                    SizedBox(height: AppSizes.h40),
                    CustomElevatedButton(
                      title: AppStrings.logout,
                      onPressed: () => context.read<ProfileCubit>().logout(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

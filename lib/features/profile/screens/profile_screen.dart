import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/core/cubit/theme_cubit.dart';
import 'package:nha_228/features/profile/cubit/profile_cubit.dart';
import 'package:nha_228/features/profile/utils/image_helper.dart';
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
                      color: AppColors.navBarColor,
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
                    SizedBox(height: AppSizes.h10),
                    Text(
                      '${userModel.firstName ?? ''} ${userModel.lastName ?? ''}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),

                    // SizedBox(height: AppSizes.h60),

                    // DataInfoFiled(
                    //   data: '${userModel.firstName ?? ''} ${userModel.lastName ?? ''}',
                    // ),
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
                    SizedBox(height: AppSizes.h20),
                    ListTile(
                      onTap: () => context.read<ProfileCubit>().logout(),
                      leading: SvgPicture.asset(
                        AppAssets.logout,
                        colorFilter: ColorFilter.mode(
                          AppColors.navBarColor,
                          BlendMode.srcIn,
                        ),
                      ),

                      title: Text(
                        AppStrings.logout,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    BlocBuilder<ThemeCubit, ThemeMode>(
                      builder: (context, state) {
                        return ListTile(
                          leading: SvgPicture.asset(
                            AppAssets.moon,
                            colorFilter: ColorFilter.mode(
                              AppColors.navBarColor,
                              BlendMode.srcIn,
                            ),
                            width: AppSizes.w24,
                            height: AppSizes.h24,
                          ),
                          title: Text(
                            AppStrings.darkMode,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          trailing: Switch(
                            activeColor: AppColors.primary,
                            value: state == ThemeMode.dark,
                            onChanged:
                                (valu) => context.read<ThemeCubit>().selectedTheme(),
                            thumbColor: WidgetStatePropertyAll(AppColors.navBarColor),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: AppSizes.h40),
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

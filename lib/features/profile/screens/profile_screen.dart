import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/core/services/hive_service.dart';
import 'package:nha_228/core/utils/app_routers.dart';
import 'package:nha_228/features/auth/models/user_model.dart';

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
      body:SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppValues.w18),
              child: Column(
                
                children: [
                   Center(
        child: InkWell(
          onTap: (){
            context.push(AppRouter.editProfileScreen);
          },
          child: const Text('Edit profile'),
        ),
      ),
                ],)))))
    //  Center(
    //     child: InkWell(
    //       onTap: (){
    //         context.push(AppRouter.editProfileScreen);
    //       },
    //       child: const Text('Edit profile'),
    //     ),
    //   ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/utils/app_routers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            context.push(AppRouter.editProfileScreen);
          },
          child: const Text('Edit profile'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/utils/app_routers.dart';
import 'package:nha_228/features/home/screens/home_screen.dart';
import 'package:nha_228/features/profile/screens/profile_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [ HomeScreen(), const ProfileScreen()];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.05, 0), //عشان يطلع من اليمين
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: IndexedStack(
          key: ValueKey<int>(_selectedIndex), // عشان AnimatedSwitcher يعرف يغير
          index: _selectedIndex,
          children: _screens,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRouter.newPostScreen);
        },
        backgroundColor: AppColors.navbarColor,
        elevation: 0,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          size: AppSizes.sp32,
          color: AppColors.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: AppSizes.h8,
        height: AppSizes.h60,
        color: AppColors.navbarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color:
                    _selectedIndex == 0
                        ? AppColors.skipbuttonColor
                        : AppColors.whiteColor,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            SizedBox(width: AppSizes.w18),
            IconButton(
              icon: Icon(
                Icons.person,
                color:
                    _selectedIndex == 1
                        ? AppColors.skipbuttonColor
                        : AppColors.whiteColor,
              ),
              onPressed: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}

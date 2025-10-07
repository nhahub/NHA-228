import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/core/utils/app_routers.dart';
import 'package:nha_228/features/home/widgets/custom_search_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppValues.h16),
          child: Column(
            children: [
              CustomSearchfield(
                hintText: AppStrings.searchHint,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context.push(AppRouter.searchScreen, extra: value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/utils/app_routers.dart';
import 'package:nha_228/features/home/data/waste_data.dart';
import 'package:nha_228/features/home/widgets/custom_search_field.dart';
import 'package:nha_228/features/home/widgets/custom_waste_item_fiels.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.h16),
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
              SizedBox(height: AppSizes.h24,),
              Expanded(
                child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 44,
                          mainAxisSpacing: 21,
                          childAspectRatio: 0.9,
                          children: List.generate(CategoryValues.wasteItems.length, (index) {
                            return CustomWasteItemFiels(item: CategoryValues.wasteItems[index]);
                          }),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

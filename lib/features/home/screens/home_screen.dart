import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/utils/app_routers.dart';
import 'package:nha_228/features/home/data/waste_data.dart';
import 'package:nha_228/features/home/widgets/custom_material_list.dart';
import 'package:nha_228/features/home/widgets/custom_search_field.dart';
import 'package:nha_228/features/home/widgets/custom_waste_item_fiels.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.h16),
          child: ListView(
            children: [
              CustomSearchfield(
                hintText: AppStrings.searchHint,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context.push(AppRouter.searchScreen, extra: value);
                  }
                },
              ),

              SizedBox(height: AppSizes.h24),

              CarouselSlider.builder(
                itemCount: CategoryValues.wasteItems.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.w8),
                    child: CustomWasteItemFiels(item: CategoryValues.wasteItems[index]),
                  );
                },
                options: CarouselOptions(
                  height: AppSizes.h150,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.6,
                ),
              ),

              SizedBox(height: AppSizes.h24),

              Text(
                AppStrings.materialsPosted,
                style: TextStyle(fontSize: AppSizes.sp16, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: AppSizes.h16),

              const CustomMaterialList(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/data/waste_data.dart';
import 'package:nha_228/features/home/widgets/category_chips.dart';
import 'package:nha_228/features/home/widgets/custom_material_list.dart';
import 'package:nha_228/features/home/widgets/custom_search_field.dart';
import 'package:nha_228/features/home/widgets/custom_waste_item_fiels.dart';
import 'package:nha_228/features/home/widgets/greeting_section.dart';
import 'package:nha_228/features/home/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.h16),
          children: [
            SizedBox(height: AppSizes.h16),

            const GreetingSection(),

            SizedBox(height: AppSizes.h24),

            CustomSearchfield(
              hintText: AppStrings.searchHint,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.push(AppRouter.searchScreen, extra: value);
                }
              },
            ),

            SizedBox(height: AppSizes.h24),

            const CategoryChips(),

            SizedBox(height: AppSizes.h24),

            const SectionHeader(title: 'Waste Prices'),

            SizedBox(height: AppSizes.h16),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.r16),
              ),
              child: CarouselSlider.builder(
                itemCount: CategoryValues.wasteItems.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.w4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.r18),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.secondary.withValues(alpha: 0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: CustomWasteItemFiels(
                        item: CategoryValues.wasteItems[index],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: AppSizes.h150,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.25,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOutCubic,
                  viewportFraction: 0.55,
                ),
              ),
            ),

            SizedBox(height: AppSizes.h32),

            SectionHeader(
              title: AppStrings.materialsPosted,
              showSeeAll: true,
              onSeeAllPressed: () {
                // Navigate to all materials
              },
            ),

            SizedBox(height: AppSizes.h16),

            const CustomMaterialList(),

            SizedBox(height: AppSizes.h24),
          ],
        ),
      ),
    );
  }
}
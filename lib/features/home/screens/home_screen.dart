import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/data/waste_data.dart';
import 'package:nha_228/features/home/widgets/custom_material_list.dart';
import 'package:nha_228/features/home/widgets/custom_search_field.dart';
import 'package:nha_228/features/home/widgets/custom_waste_item_fiels.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.homeTitle),
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
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
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
                style: Theme.of(context).textTheme.displayLarge,
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

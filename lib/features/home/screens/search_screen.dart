import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/cubit/search_cubit.dart';
import 'package:nha_228/features/home/widgets/custom_search_field.dart';

class SearchScreen extends StatefulWidget {
  final String searchWord;

  const SearchScreen({super.key, required this.searchWord});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(text: widget.searchWord);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (_) => SearchCubit()..search(widget.searchWord),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppSizes.h60),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w16,
                    vertical: AppSizes.h10,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                      Expanded(
                        child: CustomSearchfield(
                          hintText: AppStrings.searchHint,
                          controller: searchController,
                          onSubmitted: (value) {
                            context.read<SearchCubit>().search(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSizes.h10),
                    Text(
                      AppStrings.results,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(height: AppSizes.h10),

                    Expanded(
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (state is SearchLoaded) {
                            final materials = state.results;

                            return ListView.builder(
                              itemCount: materials.length,
                              itemBuilder: (context, index) {
                                final material = materials[index];
                                return Container(
                                  margin: EdgeInsets.only(bottom: AppSizes.h16),
                                  padding: EdgeInsets.all(AppSizes.h12),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors:
                                          isDark
                                              ? [
                                                AppDarkColors.categoryBackground,
                                                AppDarkColors.cardDarkColor,
                                              ]
                                              : [
                                                AppColors.navBarColor,
                                                AppColors.categoryFoot,
                                              ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(AppSizes.r16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.lightGreyTransparent,
                                        blurRadius: AppSizes.r6,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(AppSizes.r12),
                                        child:
                                            (material.imageUrl != null &&
                                                    material.imageUrl!.isNotEmpty)
                                                ? Image.network(
                                                  material.imageUrl!,
                                                  width: AppSizes.w100,
                                                  height: AppSizes.h100,
                                                  fit: BoxFit.cover,
                                                  errorBuilder:
                                                      (context, error, stackTrace) =>
                                                          Container(
                                                            width: AppSizes.w100,
                                                            height: AppSizes.h100,
                                                            color: AppColors.grey300,
                                                            child: Icon(
                                                              Icons.image_not_supported,
                                                              size: AppSizes.sp40,
                                                              color: AppColors.grey,
                                                            ),
                                                          ),
                                                )
                                                : Container(
                                                  width: AppSizes.w100,
                                                  height: AppSizes.h100,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.whiteColor,
                                                    borderRadius: BorderRadius.circular(
                                                      AppSizes.r12,
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    Icons.image_not_supported,
                                                    size: AppSizes.sp40,
                                                    color: AppColors.skipButtonColor,
                                                  ),
                                                ),
                                      ),
                                      SizedBox(width: AppSizes.w12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              material.materialType,
                                              style: TextStyle(
                                                fontSize: AppSizes.sp16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.skipButtonColor,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: AppSizes.h4),
                                            Text(
                                              material.description,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: AppSizes.sp14,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                            SizedBox(height: AppSizes.h4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    "📍 ${material.location}",
                                                    style: TextStyle(
                                                      color: AppColors.whiteColor,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    "💰 ${material.totalPrice} EG",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColors.whiteColor,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else if (state is SearchError) {
                            return Center(child: Text(state.error));
                          } else {
                            return Center(child: Text(AppStrings.noResults));
                          }
                        },
                      ),
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

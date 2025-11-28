import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/home/cubit/search_cubit.dart';
import 'package:nha_228/features/home/widgets/custom_search_field.dart';
import 'package:nha_228/features/home/widgets/material_card_item.dart';

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

                            if (materials.isEmpty) {
                              return const Center(child: Text(AppStrings.noResults));
                            }

                            return ListView.builder(
                              itemCount: materials.length,
                              itemBuilder: (context, index) {
                                final m = materials[index];

                                /// استخدمنا نفس الكارد الجاهزة اللي بتستخدمها CustomMaterialList
                                return MaterialCardItem(material: m);
                              },
                            );
                          } else if (state is SearchError) {
                            return Center(child: Text(state.error));
                          }

                          return const Center(child: Text(AppStrings.noResults));
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

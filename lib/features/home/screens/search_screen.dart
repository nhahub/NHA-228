import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/constants/app_values.dart';
import 'package:nha_228/features/home/widgets/custom_search_field.dart';

class SearchScreen extends StatefulWidget {
  final String searchWord;
  const SearchScreen({super.key, required this.searchWord});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(text: widget.searchWord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
       PreferredSize(
        preferredSize: Size.fromHeight(AppValues.h60),
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppValues.w16, vertical: AppValues.h10),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Expanded(
                  child: CustomSearchfield(
                    hintText: AppStrings.searchHint,
                    controller: searchController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppValues.w16),
          child: Column(
            children: [
              SizedBox(height: AppValues.h10,),
             Align(
              alignment: Alignment.topLeft,
              child: Text(AppStrings.results,style: Theme.of(context).textTheme.bodyMedium,),
             )
              
            ],
          ),
        ),
      ),
    );
  }
}

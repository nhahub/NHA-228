import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/features/home/models/material_model.dart';
import 'package:nha_228/features/home/utils/search_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Future<void> search(String query) async {
    emit(SearchLoading());
    try {
      final results = await SearchService().searchMaterialsByType(query);
      if (results.isEmpty) {
        emit(SearchError(error: AppStrings.noResults));
        return;
      }
      emit(SearchLoaded(results: results));
    } catch (e) {
      emit(SearchError(error: e.toString()));
    }
  }
}

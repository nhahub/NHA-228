import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark) {
    _loadTheme();
  }
  void _loadTheme() async {
    final isDark = await HiveManager().loadTheme();
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void selectedTheme() async {
    final isDark = state == ThemeMode.dark;
    await HiveManager().selectTheme();
    emit((!isDark ? ThemeMode.dark : ThemeMode.light));
  }
}

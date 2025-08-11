import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false) {
    _loadMode();
  }

  void toggleMode(bool toggled) async {
    // Future ====>
    // asynchrounus  التوازي   , synchrounus   متتاليه
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", toggled);
    emit(toggled);
  }

  void _loadMode() async {
    final prefs = await SharedPreferences.getInstance();

    final savedTheme = prefs.getBool("isDark") ?? false;
    emit(savedTheme);
  }
}
// Localization
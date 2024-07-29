import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/theme/dark_theme.dart';
import 'package:keyboard_warrior/service/theme/foundation/app_theme.dart';
import 'package:keyboard_warrior/service/theme/light_theme.dart';
import 'package:provider/provider.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    AppTheme? appTheme,
  }) : appTheme = appTheme ?? LightTheme();

  AppTheme appTheme;

  void toggleTheme() {
    if (appTheme.brightness == Brightness.light) {
      appTheme = DarkTheme();
      print('dark');
    } else {
      appTheme = LightTheme();
      print('light');
    }
    notifyListeners();
  }

  ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: appTheme.color.background,
      appBarTheme: AppBarTheme(
        backgroundColor: appTheme.color.background,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: appTheme.color.text,
        ),
        titleTextStyle: TextStyle(
          color: appTheme.color.text,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

extension ThemeServiceExt on BuildContext {
  ThemeService get themeService => watch<ThemeService>();
  AppTheme get appTheme => themeService.appTheme;
  AppColor get color => appTheme.color;
}

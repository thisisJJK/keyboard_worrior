import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/service/theme/foundation/app_theme.dart';

class DarkTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.dark;

  @override
  AppColor color = AppColor(
    modeCardColor: ColorService.grey800,
    background: ColorService.black.withOpacity(0.55),
    text: ColorService.grey100,
    subtext: ColorService.grey200,
    powerCardColor: ColorService.orange,
  );
}

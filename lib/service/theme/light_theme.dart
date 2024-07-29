import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/service/theme/foundation/app_theme.dart';

class LightTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;

  @override
  AppColor color = AppColor(
    modeCardColor: ColorService.sage,
    background: ColorService.timberwolf,
    text: ColorService.black,
    subtext: ColorService.cardTextColor,
    powerCardColor: ColorService.orange,
  );
}

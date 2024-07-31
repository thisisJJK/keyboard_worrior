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
      text: ColorService.hookergreen,
      subtext: ColorService.hookergreen,
      powerCardColor: ColorService.violet,
      powerTextColor: ColorService.black,
      nexttext: ColorService.grey700,
      hinttext: ColorService.grey400);
}

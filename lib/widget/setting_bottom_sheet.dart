import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/widget/setting_tile.dart';
import 'package:provider/provider.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeService themeService = ThemeService();
    final bool isLightTheme =
        themeService.appTheme.brightness == Brightness.light;
    return Container(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 16,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SettingTile(
              icon: isLightTheme ? Icons.light_mode : Icons.dark_mode,
              onPressed: context.read<ThemeService>().toggleTheme,
              title: '모드',
              subTitle: isLightTheme ? '라이트' : '다크',
            ),
            SettingTile(
              icon: Icons.language,
              onPressed: () {},
              title: '언어',
              subTitle: '한국어',
            ),
          ],
        ),
      ),
    );
  }
}

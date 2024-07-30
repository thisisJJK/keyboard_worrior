import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/lang_service.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/widget/setting_tile.dart';
import 'package:provider/provider.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeService themeService = context.watch<ThemeService>();
    LangService langService = context.watch<LangService>();

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
              icon: themeService.isLightTheme
                  ? Icons.light_mode
                  : Icons.dark_mode,
              onPressed: context.read<ThemeService>().toggleTheme,
              title: langService.isKor ? '테마' : 'Theme',
              subTitle: langService.isKor
                  ? themeService.isLightTheme
                      ? '라이트'
                      : '다크'
                  : themeService.isLightTheme
                      ? 'Light'
                      : 'Dark',
            ),
            SettingTile(
              icon: Icons.language,
              onPressed: context.read<LangService>().toggleLang,
              title: langService.isKor ? '언어' : 'Language',
              subTitle: langService.isKor ? '한국어' : 'English',
            ),
          ],
        ),
      ),
    );
  }
}

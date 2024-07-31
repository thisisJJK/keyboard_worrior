import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/lang_service.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/splash_view.dart';
import 'package:keyboard_warrior/ui/typing/typing_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeService(isLightTheme: true),
        ),
        ChangeNotifierProvider(
          create: (context) => LangService(isKor: true),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              TypingViewModel((speed) {}, (timer) {}, content: ''),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          context.watch<ThemeService>().appTheme.brightness == Brightness.light
              ? ThemeData.light()
              : ThemeData.dark(),
      title: 'Keyboard Warrior',
      home: const SplashView(),
    );
  }
}

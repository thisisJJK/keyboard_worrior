import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/splash_view.dart';
import 'package:keyboard_warrior/ui/mode/poem/poem_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => PoemView),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorService colorService = ColorService();
    return MaterialApp(
      title: 'Keyboard Warrior',
      theme: ThemeData(
        primaryColor: colorService.appBackgroundColor,
      ),
      home: const SplashView(),
    );
  }
}

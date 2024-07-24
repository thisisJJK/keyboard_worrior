import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/ui/mode_select/mode_selected_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ModeSelectedView()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorService colorService = ColorService();
    return Scaffold(
        backgroundColor: colorService.appBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ios_logo.png',
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ));
  }
}

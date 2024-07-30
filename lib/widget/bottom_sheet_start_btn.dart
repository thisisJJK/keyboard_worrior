import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/ui/typing/typing_view.dart';

class BottomSheetStartBtn extends StatelessWidget {
  final String title;
  final String content;
  const BottomSheetStartBtn({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => TypingView(
              title: title,
              content: content,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.color.background,
        surfaceTintColor: context.color.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        fixedSize: Size(size.width, size.height * 0.06),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.play_circle,
            color: ColorService.viridian,
            size: 26,
          ),
          Text(
            '시작!',
            style: TextStyle(
              color: ColorService.viridian,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/widget/bottom_sheet_start_btn.dart';

class DetailBottomSheet extends StatelessWidget {
  const DetailBottomSheet({
    super.key,
    required this.title,
    required this.content,
  });
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: context.color.modeCardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.color.background,
              ),
              padding: const EdgeInsets.all(24),
              width: size.width * 0.95,
              height: size.height * 0.35,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: content
                      .split('\n')
                      .map(
                        (line) => Text(
                          line,
                          style: TextStyle(
                            fontSize: 18,
                            color: context.color.text,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BottomSheetStartBtn(title: title, content: content),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/theme_service.dart';

class ModeCard extends StatelessWidget {
  const ModeCard({
    super.key,
    required this.name,
    required this.onPressed,
    required this.isWide,
  });
  final String name;
  final void Function() onPressed;
  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final Size mySize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: isWide ? mySize.width * 0.9 : mySize.width * 0.45,
        height: mySize.height * 0.15,
        child: Card(
          color: context.color.modeCardColor,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: context.color.text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

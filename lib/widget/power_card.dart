import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';

class PowerCard extends StatelessWidget {
  const PowerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorService colorService = ColorService();
    final Size mySize = MediaQuery.of(context).size;
    return SizedBox(
      height: mySize.height * 0.18,
      width: mySize.width * 0.9,
      child: Card(
        color: colorService.powerBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                '총 전투력',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: colorService.cardTextColor,
                ),
              ),
              Text(
                '12345',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: colorService.cardTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

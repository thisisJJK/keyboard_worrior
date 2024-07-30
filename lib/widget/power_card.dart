import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/lang_service.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:provider/provider.dart';

class PowerCard extends StatelessWidget {
  const PowerCard({super.key});

  @override
  Widget build(BuildContext context) {
    LangService langService = context.watch<LangService>();
    final Size mySize = MediaQuery.of(context).size;
    return SizedBox(
      height: mySize.height * 0.18,
      width: mySize.width * 0.9,
      child: Card(
        color: context.color.powerCardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                langService.isKor ? '총 전투력' : 'Total Power',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: context.color.text,
                ),
              ),
              Text(
                '12345',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: context.color.subtext,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

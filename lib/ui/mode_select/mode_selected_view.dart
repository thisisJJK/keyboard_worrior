import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/ui/mode/poem/poem_view.dart';
import 'package:keyboard_warrior/widget/mode_card.dart';
import 'package:keyboard_warrior/widget/power_card.dart';

enum Mode {
  battle(name: '배틀하기'),
  poem(name: '시'),
  word(name: '단어'),
  proverb(name: '속담'),
  custom(name: '나만의글');

  final String name;
  const Mode({required this.name});

  factory Mode.getMode(String name) {
    return Mode.values.firstWhere((value) => value.name == name);
  }
}

class ModeSelectedView extends StatelessWidget {
  const ModeSelectedView({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorService colorService = ColorService();
    return Scaffold(
      backgroundColor: colorService.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: colorService.appBackgroundColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.settings,
              size: 32,
            ),
          ),
        ],
        title: const Text(
          '키보드워리어',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            const PowerCard(),
            const SizedBox(
              height: 8,
            ),
            ModeCard(
              name: Mode.battle.name,
              onPressed: () {},
              isWide: true,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ModeCard(
                  name: Mode.poem.name,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PoemView(),
                      ),
                    );
                  },
                  isWide: false,
                ),
                ModeCard(
                  name: Mode.proverb.name,
                  onPressed: () {},
                  isWide: false,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ModeCard(
                  name: Mode.word.name,
                  onPressed: () {},
                  isWide: false,
                ),
                ModeCard(
                  name: Mode.custom.name,
                  onPressed: () {},
                  isWide: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/lang_service.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/ui/mode/custom/custom_view.dart';
import 'package:keyboard_warrior/ui/mode/poem/poem_view.dart';
import 'package:keyboard_warrior/ui/mode/proverb/proverb_view.dart';
import 'package:keyboard_warrior/ui/mode/word/word_view.dart';
import 'package:keyboard_warrior/widget/mode_card.dart';
import 'package:keyboard_warrior/widget/power_card.dart';
import 'package:keyboard_warrior/widget/setting_bottom_sheet.dart';
import 'package:provider/provider.dart';

enum Mode {
  korBattle(name: '배틀하기'),
  korPoem(name: '시'),
  korWord(name: '단어'),
  korProverb(name: '속담'),
  korCustom(name: '나만의글'),
  engBattle(name: 'Battle'),
  engPoem(name: 'Poem'),
  engWord(name: 'Word'),
  engProverb(name: 'Proverb'),
  engCustom(name: 'Custom');

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
    LangService langService = context.watch<LangService>();
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: AppBar(
        backgroundColor: context.color.background,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const SettingBottomSheet();
                    });
              },
              icon: Icon(
                Icons.settings,
                size: 32,
                color: context.color.text,
              )),
        ],
        title: Text(
          langService.isKor ? '키보드워리어' : 'Keyboard Warrior',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: context.color.text,
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
              name:
                  langService.isKor ? Mode.korBattle.name : Mode.engBattle.name,
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
                  name:
                      langService.isKor ? Mode.korPoem.name : Mode.engPoem.name,
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
                  name: langService.isKor
                      ? Mode.korProverb.name
                      : Mode.engProverb.name,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProverbView(),
                      ),
                    );
                  },
                  isWide: false,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ModeCard(
                  name:
                      langService.isKor ? Mode.korWord.name : Mode.engWord.name,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WordView(),
                      ),
                    );
                  },
                  isWide: false,
                ),
                ModeCard(
                  name: langService.isKor
                      ? Mode.korCustom.name
                      : Mode.engCustom.name,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CustomView(),
                      ),
                    );
                  },
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

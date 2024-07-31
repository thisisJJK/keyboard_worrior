import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/ui/base/base_view_model.dart';

class TypingViewModel extends BaseViewModel {
  List<String> completedSentences = [];
  List<String> totalSentences = [];
  bool isStarted = false;
  DateTime? _startTime;
  int countTypedText = 0;
  int countCompleteText = 0;
  int countTotalText = 0;
  Duration _elapsedTime = Duration.zero;
  Timer? _timer;
  final Function(double) onSpeedUpdate;
  final Function(Duration) onTimeUpate;

  int previousLinsIndex4 = -4;
  int previousLinsIndex3 = -3;
  int previousLinsIndex2 = -2;
  int previousLinsIndex1 = -1;
  int currentLineIndex = 0;
  int nextLineIndex = 1;

  String previousSentence4 = '';
  String previousSentence3 = '';
  String previousSentence2 = '';
  String previousSentence1 = '';
  String currentSentence = '';
  String nextSentence = '';
  String userInput = '';

  final String content;

  TypingViewModel(
    this.onSpeedUpdate,
    this.onTimeUpate, {
    required this.content,
  });

  void countText(String text) {
    countTypedText = text.replaceAll(RegExp(r'[,]'), '').length;
    if (currentSentence == text) {
      totalSentences.add(previousSentence1);
    }
    String completedSentences =
        totalSentences.join('').replaceAll(RegExp(r'[,]'), '');
    countCompleteText = completedSentences.length;

    countTotalText = countTypedText + countCompleteText;
    print(countCompleteText);
    print(completedSentences);
    print(countTypedText);

    _updateSpeed();
    notifyListeners();
  }

  void startTyping() {
    isStarted = true;

    _startTime = DateTime.now();
    print(_startTime);
    _elapsedTime = Duration.zero;
    _startTimer();
    notifyListeners();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _elapsedTime += const Duration(seconds: 1);

        onTimeUpate(_elapsedTime);
        _updateSpeed();
      },
    );
    notifyListeners();
  }

  // void onTextChanged(String text) {
  //   if (_startTime == null) {
  //     startTyping();
  //   }

  //   print(countTotalText);
  //   print(completedSentences);

  //   _updateSpeed();
  //   notifyListeners();
  // }

  void _updateSpeed() {
    if (_startTime == null) {
      return;
    }

    final min = _elapsedTime.inSeconds / 60;
    final speed = (min > 0) ? (countTotalText / min) : 0.0;

    onSpeedUpdate(speed);
    notifyListeners();
  }

  void timerDispose() {
    print('dispose');
    _timer?.cancel();
    isStarted = false;
  }

  void loadSentence(BuildContext context, speed) {
    bool isNext = content.split('\n').length > nextLineIndex;
    bool isLast = content.split('\n').length == nextLineIndex;
    bool isEnd = content.split('\n').length < nextLineIndex;

    if (isNext) {
      if (previousLinsIndex4 > -1) {
        previousSentence4 = content.split('\n')[previousLinsIndex4];
      }
      if (previousLinsIndex3 > -1) {
        previousSentence3 = content.split('\n')[previousLinsIndex3];
      }
      if (previousLinsIndex2 > -1) {
        previousSentence2 = content.split('\n')[previousLinsIndex2];
      }
      if (previousLinsIndex1 > -1) {
        previousSentence1 = content.split('\n')[previousLinsIndex1];
      }

      currentSentence = content.split('\n')[currentLineIndex];
      nextSentence = content.split('\n')[nextLineIndex];
    } else if (isLast) {
      nextSentence = '---The end---';
      currentSentence = content.split('\n')[currentLineIndex];
      if (previousLinsIndex1 > -1) {
        previousSentence1 = content.split('\n')[previousLinsIndex1];
        previousSentence2 = content.split('\n')[previousLinsIndex2];
        previousSentence3 = content.split('\n')[previousLinsIndex3];
        previousSentence4 = content.split('\n')[previousLinsIndex4];
      }
    } else if (isEnd) {
      timerDispose();
      showEndDialog(context, speed);
    }
    notifyListeners();
  }

  void showEndDialog(context, speed) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: context.appTheme.color.background,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '전투력 측정 완료',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    speed.toStringAsFixed(0),
                    style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.appTheme.color.modeCardColor,
                      fixedSize: const Size(200, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: context.appTheme.color.text,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void checkInput(String value) {
    userInput = '';
    if (currentLineIndex == nextLineIndex - 1) {
      currentLineIndex++;
      nextLineIndex++;
      previousLinsIndex1++;
      previousLinsIndex2++;
      previousLinsIndex3++;
      previousLinsIndex4++;
    }

    notifyListeners();
  }

  List<TextSpan> misspelingText(String currntSentence, String userInput) {
    List<TextSpan> spans = [];
    int minLength = userInput.length < currntSentence.length
        ? userInput.length
        : currentSentence.length;

    for (int i = 0; i < minLength; i++) {
      if (userInput[i] == currntSentence[i]) {
        spans.add(
          TextSpan(
            text: currntSentence[i],
            style: TextStyle(color: ColorService.viridian),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: currntSentence[i],
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        );
      }
    }
    if (userInput.length < currntSentence.length) {
      spans.add(
        TextSpan(
          text: currntSentence.substring(
            userInput.length,
          ),
        ),
      );
    }

    return spans;
  }
}

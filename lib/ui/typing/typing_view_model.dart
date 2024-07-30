import 'package:flutter/material.dart';
import 'package:keyboard_warrior/ui/base/base_view_model.dart';

class TypingViewModel extends BaseViewModel {
  int currentLineIndex = 0;
  int nextLineIndex = 1;

  String currentSentence = '';
  String nextSentence = '';
  String userInput = '';

  final String content;

  TypingViewModel({required this.content});

  void loadSentence(BuildContext context) {
    currentSentence = content.split('\n')[currentLineIndex];
    if (content.split('\n').length > nextLineIndex) {
      nextSentence = content.split('\n')[nextLineIndex];
    } else if (content.split('\n').length == nextLineIndex) {
      nextSentence = '';
      nextLineIndex++;
    } else if (content.split('\n').length < nextLineIndex) {
      Navigator.of(context).pop();
    }

    notifyListeners();
  }

  void checkInput(String value) {
    userInput = value;
    bool isSame = userInput == currentSentence;
    if (isSame) {
      userInput = '';
      if (currentLineIndex == nextLineIndex - 1) {
        currentLineIndex++;
        nextLineIndex++;
      }
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

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/ui/base/base_view_model.dart';

class WordViewModel extends BaseViewModel {
  Future<List<Word>> loadWord(bool isKor) async {
    String filePath;
    isKor
        ? filePath = 'assets/json/kor/kor_word.json'
        : filePath = 'assets/json/eng/eng_word.json';

    final String response = await rootBundle.loadString(filePath);

    final List<dynamic> data = jsonDecode(response);

    return data.map((item) => Word.fromJson(item)).toList();
  }
}

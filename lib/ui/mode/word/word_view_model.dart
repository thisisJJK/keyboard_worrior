import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/ui/mode/base/base_view_model.dart';

class WordViewModel extends BaseViewModel{
   Future<List<Word>> loadPoem(String lang) async {
    String filePath;
    if (lang == 'kor') {
      filePath = 'assets/json/kor/kor_word.json';
    } else if (lang == 'eng') {
      filePath = 'assets/json/eng/eng_word.json';
    } else {
      throw Exception('error');
    }

    final String response = await rootBundle.loadString(filePath);

    final List<dynamic> data = jsonDecode(response);

    return data.map((item) => Word.fromJson(item)).toList();
  }
} 
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/ui/base/base_view_model.dart';

class PoemViewModel extends BaseViewModel {
  Future<List<Poem>> loadPoem(bool isKor) async {
    String filePath;
    isKor
        ? filePath = 'assets/json/kor/kor_poem.json'
        : filePath = 'assets/json/eng/eng_poem.json';

    final String response = await rootBundle.loadString(filePath);

    final List<dynamic> data = jsonDecode(response);

    return data.map((item) => Poem.fromJson(item)).toList();
  }
}

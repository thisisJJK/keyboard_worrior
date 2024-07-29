import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/ui/mode/base/base_view_model.dart';

class ProverbViewModel extends BaseViewModel {
  Future<List<Proverb>> loadPoem(String lang) async {
    String filePath;
    if (lang == 'kor') {
      filePath = 'assets/json/kor/kor_proverb.json';
    } else if (lang == 'eng') {
      filePath = 'assets/json/eng/eng_proverb.json';
    } else {
      throw Exception('error');
    }

    final String response = await rootBundle.loadString(filePath);

    final List<dynamic> data = jsonDecode(response);

    return data.map((item) => Proverb.fromJson(item)).toList();
  }
}

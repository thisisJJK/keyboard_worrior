import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/ui/base/base_view_model.dart';

class ProverbViewModel extends BaseViewModel {
  Future<List<Proverb>> loadPoem(bool isKor) async {
    String filePath;
    isKor
        ? filePath = 'assets/json/kor/kor_proverb.json'
        : filePath = 'assets/json/eng/eng_proverb.json';

    final String response = await rootBundle.loadString(filePath);

    final List<dynamic> data = jsonDecode(response);

    return data.map((item) => Proverb.fromJson(item)).toList();
  }
}

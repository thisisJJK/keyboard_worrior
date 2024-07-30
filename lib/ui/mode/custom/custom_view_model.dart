import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/ui/base/base_view_model.dart';

class CustomViewModel extends BaseViewModel {
  Future<List<Custom>> loadPoem() async {
    const String filePath = 'assets/json/custom.json';

    final String response = await rootBundle.loadString(filePath);

    final List<dynamic> data = jsonDecode(response);

    return data.map((item) => Custom.fromJson(item)).toList();
  }
}

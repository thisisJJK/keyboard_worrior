import 'dart:convert';
import 'dart:io';

import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/ui/base/base_view_model.dart';
import 'package:path_provider/path_provider.dart';

class CustomViewModel extends BaseViewModel {
  final String _fileName;
  late String _path;
  late dynamic _directory;

  CustomViewModel(this._fileName) {
    init();
  }

  void init() async {
    _directory = await getApplicationDocumentsDirectory();
    _path = _directory.path;
    notifyListeners();
    print(_path);
  }

  Future<List<Custom>> loadCustom() async {
    final file = File('$_path/$_fileName');

    try {
      final jsonString = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.map((item) => Custom.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }

  // Future<List<Custom>> loadCustom() async {
  //   const String filePath = 'assets/json/custom.json';

  //   final String response = await rootBundle.loadString(filePath);

  //   final List<dynamic> data = jsonDecode(response);

  //   return data.map((item) => Custom.fromJson(item)).toList();
  // }
}

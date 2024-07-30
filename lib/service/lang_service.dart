import 'package:keyboard_warrior/ui/base/base_view_model.dart';

class LangService extends BaseViewModel {
  @override
  bool isKor;

  LangService({required this.isKor});

  void toggleLang() {
    isKor = isKor ? isKor = false : isKor = true;
    notifyListeners();
  }
}

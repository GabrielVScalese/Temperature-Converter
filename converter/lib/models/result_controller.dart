import 'package:flutter/cupertino.dart';

class ResultController extends ChangeNotifier {
  static ResultController instance = ResultController();

  String result = '(Para) Temperatura em Kelvin';

  changeResultText(text) {
    result = text;
    notifyListeners();
  }
}

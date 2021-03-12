import 'package:flutter/cupertino.dart';

class InputController extends ChangeNotifier {
  static InputController instance = InputController();

  String result = '(De) Temperatura em Kelvin';

  changeResultText(text) {
    result = text;
    notifyListeners();
  }
}

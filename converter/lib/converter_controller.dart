import 'package:flutter/cupertino.dart';

class ConverterController extends ChangeNotifier {
  static ConverterController instance = ConverterController();

  String result = 'Temperatura em Kelvin';

  changeResultText(text) {
    result = text;
    notifyListeners();
  }
}

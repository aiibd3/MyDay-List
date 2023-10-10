import 'package:flutter/material.dart';

class MProvider extends ChangeNotifier {
  String languageCode = "en";

  void changeLanguage(String language) {
    languageCode = language;
    notifyListeners();
  }
}

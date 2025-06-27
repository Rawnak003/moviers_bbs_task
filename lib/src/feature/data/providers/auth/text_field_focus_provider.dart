import 'package:flutter/material.dart';

class TextFieldFocusProvider extends ChangeNotifier {
  final Map<String, bool> _focusMap = {};

  bool isFocused(String id) => _focusMap[id] ?? false;

  void setFocus(String id, bool isFocused) {
    if (_focusMap[id] != isFocused) {
      _focusMap[id] = isFocused;
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

extension BuildContextHelper on BuildContext {
  double get getHeight => MediaQuery.of(this).size.height;

  double get getWidth => MediaQuery.of(this).size.width;

  double get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom;

  AppLocalizations? get locale => AppLocalizations.of(this);

  void showSnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }
}

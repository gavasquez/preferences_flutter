import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool modoOscuro})
      : currentTheme = modoOscuro ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkModo() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}

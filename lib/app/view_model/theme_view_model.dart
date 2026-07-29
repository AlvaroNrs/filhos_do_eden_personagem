import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  final themeViewColor = ValueNotifier<Color>(AppColors.neutralThemeColor);

  void changeThemeColor(Color newColor) {
    themeViewColor.value = newColor;
    notifyListeners();
  }
}
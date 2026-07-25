import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  Color colorTheme = AppColors.neutralThemeColor;

  void changeThemeColor(Color newTheme){
    colorTheme = newTheme;
    notifyListeners();
  }
}
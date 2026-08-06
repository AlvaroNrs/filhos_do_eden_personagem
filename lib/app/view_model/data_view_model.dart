import 'package:filhos_do_eden_personagem/app/model/character.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/character_type.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:flutter/material.dart';

class DataViewModel extends ChangeNotifier {
  final themeViewColor = ValueNotifier<Color>(AppColors.neutralThemeColor);
  final characterViewModel = ValueNotifier<Character>(Character(id: "0", name: "Azrael", type: CharacterType.querubim,
      selectedStrain: Strain.legionario),);

  void changeThemeColor(LightAndDarkness? lightAndDarkness)  {
    if(lightAndDarkness == null) themeViewColor.value = AppColors.neutralThemeColor;
    if(lightAndDarkness == LightAndDarkness.light) themeViewColor.value = AppColors.celestialThemeColor;
    if(lightAndDarkness == LightAndDarkness.darkness) themeViewColor.value = AppColors.infernalThemeColor;
    notifyListeners();
  }

  void changeCharacter(Character c) {
    characterViewModel.value = c;
    notifyListeners();
  }
}
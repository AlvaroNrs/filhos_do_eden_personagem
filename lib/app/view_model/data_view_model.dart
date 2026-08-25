import 'package:filhos_do_eden_personagem/app/model/character.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/character_type.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DataViewModel extends ChangeNotifier {
  final themeViewColor = ValueNotifier<Color>(AppColors.neutralThemeColor);
  late var characterViewModel = generateNew();

  void changeThemeColor(LightAndDarkness? lightAndDarkness)  {
    if(lightAndDarkness == null) themeViewColor.value = AppColors.neutralThemeColor;
    if(lightAndDarkness == LightAndDarkness.light) themeViewColor.value = AppColors.celestialThemeColor;
    if(lightAndDarkness == LightAndDarkness.darkness) themeViewColor.value = AppColors.infernalThemeColor;
    notifyListeners();
  }

  void changeCharacter(String? id, String? name, LightAndDarkness? side, CharacterType? characterType, Strain? strain) {
    if(id != null) characterViewModel.value.id = id;
    if(side != null) characterViewModel.value.side = side;
    if(characterType != null) characterViewModel.value.type = characterType;
    if(strain != null) characterViewModel.value.selectedStrain = strain;
    if(name != null && name.isNotEmpty) characterViewModel.value.name = name;
    notifyListeners();
  }

  void setNullDetailCharacter(){
    characterViewModel.value.type = null;
    characterViewModel.value.selectedStrain = null;
    characterViewModel.value.name = "";
    notifyListeners();
  }

  void resetGeneratedCharacter(){
    characterViewModel = generateNew();
    notifyListeners();
  }

  ValueNotifier<Character> generateNew(){
    return ValueNotifier<Character>(Character(id: Uuid().v1(), name: "", side: LightAndDarkness.neutral,
      type: null, selectedStrain: null),);
  }
}
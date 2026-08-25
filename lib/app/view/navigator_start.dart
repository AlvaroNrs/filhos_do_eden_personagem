import 'package:filhos_do_eden_personagem/app/model/character.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/character_type.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';
import 'package:filhos_do_eden_personagem/app/view/pages/character_creation_page.dart';
import 'package:filhos_do_eden_personagem/app/view/pages/character_sheet_page.dart';
import 'package:filhos_do_eden_personagem/app/view/pages/created_characters_page.dart';
import 'package:filhos_do_eden_personagem/app/view/pages/home_page.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view_model/data_view_model.dart';
import 'package:flutter/material.dart';

class NavigatorStart extends StatefulWidget {
  const NavigatorStart({super.key});

  @override
  State<NavigatorStart> createState() => _NavigatorStartState();
}

class _NavigatorStartState extends State<NavigatorStart> {
  int currentIndex = 0;
  final dataViewModel = DataViewModel();
  int currentStep = 0;
  List<bool> optionSelected = [false, false, false];
  List<String> descriptionList = ["", "", ""];

  List<Character> charactersList = [
    Character(
      id: "1",
      name: "Azrael",
      side: LightAndDarkness.light,
      type: CharacterType.querubim,
      selectedStrain: Strain.legionario,
    ),
    Character(
      id: "2",
      name: "Meu Advogado",
      side: LightAndDarkness.darkness,
      type: CharacterType.baal,
      selectedStrain: Strain.negociante,
    ),
  ];

  // 1. Remova a variável `late final List<Widget> _pages` de cima

  void updateIndex(int i) {
    setState(() {
      currentIndex = i;
    });
  }

  void updateStep(int newStep) {
    setState(() {
      currentStep = newStep;
    });
  }

  void updateOptionSelected(int indexToUpdate) {
    setState(() {
      optionSelected[indexToUpdate] = !optionSelected[indexToUpdate];
    });
  }

  void updateDescription(int index, String newDescription) {
    setState(() {
      descriptionList[index] = newDescription;
    });
  }

  void resetOptions() {
    setState(() {
      optionSelected = [false, false, false];
      descriptionList = ["", "", ""];
    });
  }

  void resetInnerDescriptions() {
    setState(() {
      descriptionList[1] = "";
      descriptionList[2] = "";
      optionSelected = [optionSelected[0], false, false];
    });
  }

  void setEditingOptions() {
    setState(() {
      optionSelected = [true, true, true];
      descriptionList = [
        dataViewModel.characterViewModel.value.sideDefinition.description,
        dataViewModel.characterViewModel.value.classDefinition.description,
        dataViewModel.characterViewModel.value.strainDefinition.description,
      ];
    });
  }

  void removeCharacter(Character c){
    setState(() {
      charactersList.remove(c);
    });
  }

  Widget _buildCurrentPage() {
    switch (currentIndex) {
      case 0:
        return HomePage(
          dataViewModel: dataViewModel,
          updateIndex: updateIndex,
          updateStep: updateStep,
          resetOptions: resetOptions
        );
      case 1:
        return CreatedCharactersPage(
          charactersList: charactersList,
          dataViewModel: dataViewModel,
          updateIndex: updateIndex,
          removeCharacter: removeCharacter,
        );
      case 2:
        return CharacterSheetPage(
          dataViewModel: dataViewModel,
          updateIndex: updateIndex,
          updateStep: updateStep,
          setEditingOptions: setEditingOptions,
        );
      case 3:
      default:
        return CharacterCreationPage(
          dataViewModel: dataViewModel,
          updateIndex: updateIndex,
          charactersList: charactersList,
          currentStep: currentStep,
          updateStep: updateStep,
          optionSelected: optionSelected,
          descriptionList: descriptionList,
          resetInnerDescriptions: resetInnerDescriptions,
          updateDescription: updateDescription,
          updateOptionSelected: updateOptionSelected,
          resetOptions: resetOptions,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder<Color>(
        valueListenable: dataViewModel.themeViewColor,
        builder: (context, color, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  AppColors.baseThemeColor,
                  color,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: child,
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: _buildCurrentPage(), // 3. Usa a chamada dinâmica
          ),
        ),
      ),
    );
  }
}
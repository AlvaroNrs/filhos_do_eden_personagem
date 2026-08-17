import 'dart:core';
import 'package:filhos_do_eden_personagem/app/model/character_type_definition.dart';
import 'package:filhos_do_eden_personagem/app/repository/character_type_catalog.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/creation_step_page.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/type_selector.dart';
import 'package:filhos_do_eden_personagem/app/view_model/data_view_model.dart';
import 'package:flutter/material.dart';

class CharacterCreationPage extends StatefulWidget {
  final DataViewModel dataViewModel;
  final Function(int i) updateIndex;

  const CharacterCreationPage({
    super.key,
    required this.dataViewModel,
    required this.updateIndex,
  });

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  List<bool> optionSelected = [false, false, false];
  List<String> descriptionList = ["", "", ""];
  Color detailColor = AppColors.darkBrown;
  int currentStep = 0;

  final List<CharacterClassDefinition> lightCharacters = CharacterTypeCatalog.classes.values
    .where((character) => character.lightAndDarkness == LightAndDarkness.light).toList();
  final List<CharacterClassDefinition> darknessCharacters = CharacterTypeCatalog.classes.values
    .where((character) => character.lightAndDarkness == LightAndDarkness.darkness).toList();

  List<CharacterClassDefinition> get actualTypeList => widget.dataViewModel.characterViewModel.value.side == 
    LightAndDarkness.light ? lightCharacters : darknessCharacters;


  void updateStep(int newStep){
    setState(() {
      currentStep = newStep;
    });
  }

  void updateDetailColor(Color newColor){
    setState(() {
      detailColor = newColor;
    });
  }

  void updateOptionSelected(int indexToUpdate) {
    List<bool> tempIndexToUpdate = optionSelected;
    tempIndexToUpdate[indexToUpdate] = !tempIndexToUpdate[indexToUpdate];
    setState(() {
      optionSelected = tempIndexToUpdate;
    });
  }

  void updateDescription(int index, String newDescription){
    List<String> tempListDesc = descriptionList;
    tempListDesc[index] = newDescription;
    setState(() {
      descriptionList = tempListDesc;
    });
  }

  void resetInnerDescriptions(){
    List<String> tempListDesc = descriptionList;
    tempListDesc[1] = "";
    tempListDesc[2] = "";
    setState(() {
      descriptionList = tempListDesc;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final creationStepInfoList = [
      CreationStepPage(
        dataViewModel: widget.dataViewModel,
        title: "1 - Luz e Trevas",
        subtitle: "Escolha seu lado",
        description: descriptionList[0],
        mainContentAligment: MainAxisAlignment.spaceAround,
        columnSpacing: 5,
        currentStep: currentStep,
        totalSteps: 5,
        optionSelected: optionSelected[0],
        updateIndex: widget.updateIndex,
        updateStep: updateStep,
        detailColor: detailColor,
        updateOptionSelected: updateOptionSelected,
        updateStepDescription: updateDescription,
        descriptionList: descriptionList,
        children: [
          IconButton(
            iconSize: 160,
            onPressed: () {
                updateDetailColor(AppColors.darkCelestialThemeColor);
                if(widget.dataViewModel.characterViewModel.value.side == LightAndDarkness.darkness) resetInnerDescriptions();
                widget.dataViewModel.changeCharacter("", LightAndDarkness.light, null, null);
                widget.dataViewModel.changeThemeColor(LightAndDarkness.light);
                updateDescription(0, widget.dataViewModel.characterViewModel.value.sideDefinition.description);
                if(!optionSelected[0]) updateOptionSelected(0);
            },
            icon: CircleAvatar(
              radius: 80,
              backgroundColor: AppColors.gold,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: widget.dataViewModel.characterViewModel.value.side == LightAndDarkness.light &&
                  optionSelected[0] ? AppColors.darkCelestialThemeColor : AppColors.darkBrown,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    "assets/celestial.png",
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Angélico".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
            color: AppColors.darkBrown,
            fontSize: 22,
            fontFamily: 'Eremaeus',
            ),
          ),
          Column(
            spacing: 5,
            children: [
              IconButton(
                iconSize: 160,
                onPressed: () {
                  updateDetailColor(AppColors.darkInfernalThemeColor);
                  if(widget.dataViewModel.characterViewModel.value.side == LightAndDarkness.light) resetInnerDescriptions();
                  widget.dataViewModel.changeCharacter("", LightAndDarkness.darkness, null, null);
                  widget.dataViewModel.changeThemeColor(LightAndDarkness.darkness);
                  updateDescription(0, widget.dataViewModel.characterViewModel.value.sideDefinition.description);
                  if(!optionSelected[0]) updateOptionSelected(0);
                },
                icon: CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColors.gold,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: widget.dataViewModel.characterViewModel.value.side == LightAndDarkness.darkness &&
                      optionSelected[0] ? AppColors.darkInfernalThemeColor : AppColors.darkBrown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/infernal.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Infernal".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                color: AppColors.darkBrown,
                fontSize: 22,
                fontFamily: 'Eremaeus',
                ),
              ),
            ],
          ),
        ],
      ),
      
      CreationStepPage(
        dataViewModel: widget.dataViewModel,
        title: widget.dataViewModel.characterViewModel.value.side == LightAndDarkness.light ? "2 - Casta Angélica" : "2 - Hoste Infernal",
        subtitle: widget.dataViewModel.characterViewModel.value.side == LightAndDarkness.light ? "Escolha sua casta" : "Escolha sua hoste",
        descriptionList: descriptionList,
        mainContentAligment: MainAxisAlignment.spaceAround,
        columnSpacing: 5,
        totalSteps: 3,
        currentStep: currentStep,
        description: descriptionList[1],
        optionSelected: optionSelected[1],
        updateIndex: widget.updateIndex,
        updateStep: updateStep,
        detailColor: detailColor,
        updateOptionSelected: updateOptionSelected,
        updateStepDescription: updateDescription,
        children: [
          GridView.count(
            padding: EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.55,
            children: [
              for(var type in actualTypeList)
              TypeSelector(iconAssetPath: type.typeIconAssetPath, dataViewModel: widget.dataViewModel,
                type: type, updateDescription: updateDescription, updateOptionSelected: updateOptionSelected, 
                selected: optionSelected[1],),
            ]
          )
        ],
      ),
    ];
    return creationStepInfoList[currentStep];
  }
}
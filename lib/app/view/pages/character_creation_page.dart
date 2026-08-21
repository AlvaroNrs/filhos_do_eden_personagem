import 'dart:core';
import 'package:filhos_do_eden_personagem/app/model/character.dart';
import 'package:filhos_do_eden_personagem/app/model/character_type_definition.dart';
import 'package:filhos_do_eden_personagem/app/model/strain_definition.dart';
import 'package:filhos_do_eden_personagem/app/repository/character_type_catalog.dart';
import 'package:filhos_do_eden_personagem/app/repository/power_catalog.dart';
import 'package:filhos_do_eden_personagem/app/repository/strain_catalog.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/view/pages/character_sheet_page.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/creation_step_page.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/strain_selector.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/type_selector.dart';
import 'package:filhos_do_eden_personagem/app/view_model/data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharacterCreationPage extends StatefulWidget {
  final int currentStep;
  final DataViewModel dataViewModel;
  final Function(int i) updateStep;
  final Function(int i) updateIndex;
  final Function(int i) updateOptionSelected;
  final Function(int i, String t) updateDescription;
  final Function() resetInnerDescriptions;
  final Function() resetOptions;
  final List<Character> charactersList;
  final List<bool> optionSelected;
  final List<String> descriptionList;
  
  const CharacterCreationPage({
    super.key,
    required this.dataViewModel,
    required this.updateIndex, required this.charactersList, required this.currentStep,
    required this.updateStep, required this.optionSelected, required this.descriptionList,
    required this.updateDescription, required this.updateOptionSelected, required this.resetInnerDescriptions,
    required this.resetOptions,
  });

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  Color detailColor = AppColors.darkBrown;
  final TextEditingController _nameController = TextEditingController();
  final int totalSteps = 3;

  final List<CharacterClassDefinition> lightCharacters = CharacterTypeCatalog.classes.values
    .where((character) => character.lightAndDarkness == LightAndDarkness.light).toList();
  final List<CharacterClassDefinition> darknessCharacters = CharacterTypeCatalog.classes.values
    .where((character) => character.lightAndDarkness == LightAndDarkness.darkness).toList();
  
  List<CharacterClassDefinition> get actualTypeList => widget.dataViewModel.characterViewModel.value.side == 
  LightAndDarkness.light ? lightCharacters : darknessCharacters;

  List<StrainDefinition> get actualStrainList {
  final selectedType = widget.dataViewModel.characterViewModel.value.type;
  if (selectedType == null) return [];
  // Busca a definição do tipo selecionado
  final classDefinition = CharacterTypeCatalog.classes[selectedType];
  if (classDefinition == null) return [];
  // Mapeia os enums de possibleStrains para os objetos StrainDefinition do StrainCatalog
  return classDefinition.possibleStrains
      .map((strainEnum) => StrainCatalog.strains[strainEnum])
      .whereType<StrainDefinition>() // Garante tipo não nulo
      .toList();
  }

  List<String> get skillBonusList => widget.dataViewModel.characterViewModel.value.classDefinition.
      skillsBonus.map((e) => "+${e.bonus} ${e.skill.name}").toList();
    List<String> get powersList => widget.dataViewModel.characterViewModel.value.classDefinition.
      startPowers.map((e) => e.definition.name).toList();
    List<String> get benefitsList => widget.dataViewModel.characterViewModel.value.classDefinition.
      benefits.toList();

  void updateDetailColor(Color newColor){
    setState(() {
      detailColor = newColor;
    });
  }

  void updateCharacterName(){
    if(_nameController.text != ""){
      widget.dataViewModel.changeCharacter(null, _nameController.text, null, null, null);
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    _nameController.text = widget.dataViewModel.characterViewModel.value.name.toUpperCase();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    final creationStepInfoList = [
      CreationStepPage(
        dataViewModel: widget.dataViewModel,
        title: "1 - Luz e Trevas",
        subtitle: "Escolha seu lado",
        description: widget.descriptionList[0],
        charactersList: widget.charactersList,
        mainContentAligment: MainAxisAlignment.spaceAround,
        columnSpacing: 5,
        currentStep: widget.currentStep,
        totalSteps: totalSteps,
        resetOptions: widget.resetOptions,
        optionSelected: widget.optionSelected[0],
        visibleDescription: true,
        updateIndex: widget.updateIndex,
        updateStep: widget.updateStep,
        detailColor: detailColor,
        updateStepDescription: widget.updateDescription,
        descriptionList: widget.descriptionList,
        children: [
          IconButton(
            iconSize: 160,
            onPressed: () {
                updateDetailColor(AppColors.darkCelestialThemeColor);
                if(widget.dataViewModel.characterViewModel.value.side == LightAndDarkness.darkness) widget.resetInnerDescriptions();
                widget.dataViewModel.changeCharacter(null, "", LightAndDarkness.light, null, null);
                widget.dataViewModel.changeThemeColor(LightAndDarkness.light);
                widget.updateDescription(0, widget.dataViewModel.characterViewModel.value.sideDefinition.description);
                if(!widget.optionSelected[0]) widget.updateOptionSelected(0);
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
                  widget.optionSelected[0] ? AppColors.darkCelestialThemeColor : AppColors.darkBrown,
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
                  if(widget.dataViewModel.characterViewModel.value.side == LightAndDarkness.light) widget.resetInnerDescriptions();
                  widget.dataViewModel.changeCharacter(null, "", LightAndDarkness.darkness, null, null);
                  widget.dataViewModel.changeThemeColor(LightAndDarkness.darkness);
                  widget.updateDescription(0, widget.dataViewModel.characterViewModel.value.sideDefinition.description);
                  if(!widget.optionSelected[0]) widget.updateOptionSelected(0);
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
                      widget.optionSelected[0] ? AppColors.darkInfernalThemeColor : AppColors.darkBrown,
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
        descriptionList: widget.descriptionList,
        charactersList: widget.charactersList,
        mainContentAligment: MainAxisAlignment.spaceAround,
        columnSpacing: 5,
        totalSteps: totalSteps,
        currentStep: widget.currentStep,
        description: widget.descriptionList[1],
        optionSelected: widget.optionSelected[1],
        visibleDescription: true,
        updateIndex: widget.updateIndex,
        updateStep: widget.updateStep,
        detailColor: detailColor,
        resetOptions: widget.resetOptions,
        updateStepDescription: widget.updateDescription,
        children: [
          GridView.count(
            padding: EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.55,
            children: [
              for(var type in actualTypeList)
              TypeSelector(iconAssetPath: type.typeIconAssetPath, dataViewModel: widget.dataViewModel,
                type: type, updateDescription: widget.updateDescription, updateOptionSelected: widget.updateOptionSelected, 
                selected: widget.optionSelected[1], upperSelection: widget.optionSelected[2],),
            ]
          )
        ],
      ),

      CreationStepPage(
        dataViewModel: widget.dataViewModel,
        title: "3 - Estirpe",
        subtitle: "Escolha sua estirpe",
        descriptionList: widget.descriptionList,
        charactersList: widget.charactersList,
        mainContentAligment: MainAxisAlignment.spaceAround,
        columnSpacing: 5,
        totalSteps: totalSteps,
        currentStep: widget.currentStep,
        description: widget.descriptionList[2],
        optionSelected: widget.optionSelected[2],
        visibleDescription: false,
        updateIndex: widget.updateIndex,
        updateStep: widget.updateStep,
        detailColor: detailColor,
        resetOptions: widget.resetOptions,
        updateStepDescription: widget.updateDescription,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              spacing: 12,
              children: [
                for(var strain in actualStrainList)
                StrainSelector(dataViewModel: widget.dataViewModel,
                  strainDefinition: strain, updateDescription: widget.updateDescription,
                  updateOptionSelected: widget.updateOptionSelected, selected: widget.optionSelected[2],
                ),
              ],
            ),
          )
        ],
      ),

      CreationStepPage(
        dataViewModel: widget.dataViewModel,
        title: "4 - Detalhes",
        subtitle: "Nomeie seu personagem",
        descriptionList: widget.descriptionList,
        charactersList: widget.charactersList,
        mainContentAligment: MainAxisAlignment.spaceAround,
        columnSpacing: 5,
        totalSteps: totalSteps,
        currentStep: widget.currentStep,
        description: "",
        optionSelected: _nameController.text.length > 1,
        visibleDescription: false,
        updateIndex: widget.updateIndex,
        updateStep: widget.updateStep,
        detailColor: detailColor,
        resetOptions: widget.resetOptions,
        updateStepDescription: widget.updateDescription,
        children: [
          if (widget.dataViewModel.characterViewModel.value.type != null && 
              widget.dataViewModel.characterViewModel.value.selectedStrain != null)
            Expanded(
              child: Column(
                spacing: 20,
                children: [
                  SizedBox(height: 10,),
                  TextSelectionTheme(
                    data: const TextSelectionThemeData(
                      cursorColor: AppColors.darkBrown,          // Cor da barra vertical
                      selectionHandleColor: AppColors.darkBrown, // Cor da "gota" / marcador
                      selectionColor: AppColors.darkBrown,
                    ),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      inputFormatters: [
                        TextInputFormatter.withFunction(
                          (oldValue, newValue) => TextEditingValue(
                            text: newValue.text.toUpperCase(),
                            selection: newValue.selection,
                          ),
                        ),
                      ],
                      controller: _nameController,
                      maxLength: 14,
                      scrollPadding: const EdgeInsets.only(bottom: 120),
                      onChanged: (value) => updateCharacterName(),
                      cursorColor: AppColors.darkBrown,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        fontFamily: "Eremaeus",
                        fontSize: 20,
                      ),
                      decoration: _buildInputDecoration("Nome".toUpperCase()),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 6,
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: AppColors.gold,
                        child: Center(
                          child: Image.asset(
                            widget.dataViewModel.characterViewModel.value.classDefinition.typeIconAssetPath,
                            width: 45,
                            height: 45,
                          ),
                        ),
                      ),
                      Text(
                        widget.dataViewModel.characterViewModel.value.classDefinition.name.toUpperCase()
                            .replaceAll("/", " - "),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.darkBrown,
                          fontSize: 18,
                          fontFamily: 'Eremaeus',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundColor: AppColors.gold,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 350),
                                curve: Curves.easeInOut,
                                width: 130,
                                height: 130,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    widget.dataViewModel.characterViewModel.value.strainDefinition.avatarAssetPath,
                                    width: 130,
                                    height: 130,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.dataViewModel.characterViewModel.value.strainDefinition.name.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppColors.darkBrown,
                                fontSize: 15,
                                fontFamily: 'Eremaeus',
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: Text(
                          widget.dataViewModel.characterViewModel.value.strainDefinition.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.darkBrown,
                            fontSize: 16,
                            fontFamily: 'Belleza',
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SheetSectionDetail(
                              title: "Habilidades",
                              side: widget.dataViewModel.characterViewModel.value.classDefinition.lightAndDarkness,
                              list: skillBonusList,
                            ),
                            SheetSectionDetail(
                              title: widget.dataViewModel.characterViewModel.value.side == LightAndDarkness.light ? "Divindades" : "Profanações",
                              side: widget.dataViewModel.characterViewModel.value.classDefinition.lightAndDarkness,
                              list: powersList,
                            ),
                            SheetSectionDetail(
                              title: "Benefícios",
                              side: widget.dataViewModel.characterViewModel.value.classDefinition.lightAndDarkness,
                              list: benefitsList,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      )
    ];
    return creationStepInfoList[widget.currentStep];
  }
}

InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      contentPadding: const EdgeInsets.symmetric(
        vertical: -1,   // Quanto menor, mais próximo da linha inferior
        horizontal: 0,
      ),
      labelStyle: TextStyle(
        color: AppColors.lightGray,
        fontFamily: "Eremaeus",
      ),
      floatingLabelStyle: TextStyle(
        color: AppColors.darkBrown,
        fontFamily: "Eremaeus",
        fontWeight: FontWeight.bold,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.black, width: 2),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightGray),
      ),
    );
  }
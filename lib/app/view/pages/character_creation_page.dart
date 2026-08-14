import 'dart:core';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/buttons/custom_text_button.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/creation_stage_bar.dart';
import 'package:filhos_do_eden_personagem/app/view_model/data_view_model.dart';
import 'package:flutter/material.dart';

class CharacterCreationPage extends StatefulWidget {
  final DataViewModel dataViewModel;
  final int currentStep;
  final Function(int i) updateIndex;
  final Function(int i) updateStep;

  const CharacterCreationPage({
    super.key,
    required this.dataViewModel,
    required this.currentStep,
    required this.updateIndex,
    required this.updateStep,
  });

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  bool optionSelected = false;
  String actualDescription = "";
  Color detailColor = AppColors.darkBrown;

  void updateDetailColor(Color newColor){
    setState(() {
      detailColor = newColor;
    });
  }

  void updateOptionSelected() {
    setState(() {
      optionSelected = !optionSelected;
    });
  }

  void updateDescription(String newDescription){
    setState(() {
      actualDescription = newDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    final creationStepInfoList = [
      CreationStepPage(
        dataViewModel: widget.dataViewModel,
        title: "1 - Luz e Trevas",
        subtitle: "Escolha seu lado",
        description: actualDescription,
        mainContentAligment: MainAxisAlignment.spaceAround,
        currentStep: widget.currentStep,
        optionSelected: optionSelected,
        updateIndex: widget.updateIndex,
        updateStep: widget.updateStep,
        detailColor: detailColor,
        updateOptionSelected: updateOptionSelected,
        children: [
          Column(
            spacing: 5,
            children: [
              IconButton(
                iconSize: 160,
                onPressed: () {
                    updateDetailColor(AppColors.darkCelestialThemeColor);
                    widget.dataViewModel.changeCharacter("", LightAndDarkness.light, null, null);
                    widget.dataViewModel.changeThemeColor(LightAndDarkness.light);
                    updateDescription(widget.dataViewModel.characterViewModel.value.sideDefinition.description);
                    if(!optionSelected) updateOptionSelected();
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
                      optionSelected ? AppColors.darkCelestialThemeColor : AppColors.darkBrown,
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
            ],
          ),
          Column(
            spacing: 5,
            children: [
              IconButton(
                iconSize: 160,
                onPressed: () {
                  updateDetailColor(AppColors.darkInfernalThemeColor);
                  widget.dataViewModel.changeCharacter("", LightAndDarkness.darkness, null, null);
                  widget.dataViewModel.changeThemeColor(LightAndDarkness.darkness);
                  updateDescription(widget.dataViewModel.characterViewModel.value.sideDefinition.description);
                  if(!optionSelected) updateOptionSelected();
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
                      optionSelected ? AppColors.darkInfernalThemeColor : AppColors.darkBrown,
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
    ];

    return creationStepInfoList[widget.currentStep];
  }
}

class CreationStepPage extends StatelessWidget {
  final DataViewModel dataViewModel;
  final String title;
  final String subtitle;
  final String description;
  final List<Widget> children;
  final int currentStep;
  final bool optionSelected;
  final Color detailColor;
  final MainAxisAlignment mainContentAligment;
  final Function(int i) updateIndex;
  final Function(int i) updateStep;
  final Function() updateOptionSelected;

  const CreationStepPage({
    super.key,
    required this.dataViewModel,
    required this.title,
    required this.subtitle,
    required this.children,
    required this.currentStep,
    required this.optionSelected,
    required this.updateIndex,
    required this.updateStep,
    required this.updateOptionSelected,
    required this.mainContentAligment, required this.description,
    required this.detailColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CreatorStageBar(totalSteps: 4, currentStep: currentStep),
          SizedBox(height: 20,),
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.darkBrown,
              fontSize: 25,
              fontFamily: 'Eremaeus',
            ),
          ),
          Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: optionSelected ? detailColor : AppColors.darkBrown,
                fontSize: 22,
                fontFamily: 'Belleza',
              ),
            ),
          Expanded(
            child: Column(
              mainAxisAlignment: mainContentAligment,
              children: children,
            ),
          ),
          SizedBox(
            height: 60,
            child: optionSelected ? Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: optionSelected ? detailColor : AppColors.darkBrown,
                fontSize: 16,
                fontFamily: 'Belleza',
              ),
            ) : null,
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: optionSelected
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              CustomTextButton(
                text: "Voltar",
                onPressed: () {
                  dataViewModel.changeThemeColor(null);
                  updateIndex(0);
                },
              ),
              if (optionSelected)
                CustomTextButton(
                  text: "Avançar",
                  onPressed: () {
                    updateStep(0);
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
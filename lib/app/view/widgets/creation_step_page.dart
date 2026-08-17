import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/buttons/custom_text_button.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/creation_stage_bar.dart';
import 'package:filhos_do_eden_personagem/app/view_model/data_view_model.dart';
import 'package:flutter/material.dart';

class CreationStepPage extends StatelessWidget {
  final DataViewModel dataViewModel;
  final String title;
  final String subtitle;
  final String description;
  final List<String> descriptionList;
  final List<Widget> children;
  final int totalSteps;
  final int currentStep;
  final bool optionSelected;
  final bool visibleDescription;
  final Color detailColor;
  final MainAxisAlignment mainContentAligment;
  final double columnSpacing;
  final Function(int i) updateIndex;
  final Function(int i) updateStep;
  final Function(int i, String s) updateStepDescription;
  final Function(int i) updateOptionSelected;

  const CreationStepPage({
    super.key,
    required this.dataViewModel,
    required this.title,
    required this.subtitle,
    required this.children,
    required this.totalSteps,
    required this.currentStep,
    required this.optionSelected,
    required this.updateIndex,
    required this.updateStep,
    required this.updateOptionSelected,
    required this.mainContentAligment, 
    required this.columnSpacing,
    required this.description,
    required this.detailColor, required this.descriptionList, required this.updateStepDescription, required this.visibleDescription
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
              spacing: columnSpacing,
              children: children,
            ),
          ),
          SizedBox(
            height: visibleDescription! ? 75 : 0,
            child: optionSelected && visibleDescription ? Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: optionSelected ? detailColor : AppColors.darkBrown,
                fontSize: 16,
                fontFamily: 'Belleza',
              ),
            ) : null,
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: optionSelected
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              CustomTextButton(
                text: "Voltar",
                onPressed: () {
                  if(currentStep <= 0){
                    dataViewModel.changeThemeColor(null);
                    updateIndex(0);
                  } else {
                    updateStep(currentStep-1);
                  }
                },
              ),
              if (optionSelected)
                CustomTextButton(
                  text: "Avançar",
                  onPressed: () {
                    if(currentStep+1 <= totalSteps-1){
                      updateStep(currentStep+1);
                    }
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
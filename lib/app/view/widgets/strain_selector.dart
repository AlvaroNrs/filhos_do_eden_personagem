import 'package:filhos_do_eden_personagem/app/model/strain_definition.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view_model/data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';

class StrainSelector extends StatelessWidget {
  final DataViewModel dataViewModel;
  final StrainDefinition strainDefinition;
  final bool selected;
  final Function(int i, String s) updateDescription;
  final Function(int i) updateOptionSelected;
  const StrainSelector({super.key, required this.dataViewModel, required this.strainDefinition,
  required this.updateDescription, required this.updateOptionSelected, required this.selected, });

  @override
  Widget build(BuildContext context) {
    Color detailColor = dataViewModel.characterViewModel.value.side 
    == LightAndDarkness.light ? AppColors.darkCelestialThemeColor : AppColors.darkInfernalThemeColor;

    return GestureDetector(
      onTap: () {
        updateDescription(2, strainDefinition.description);
        dataViewModel.changeCharacter(null, "", null, null, strainDefinition.strain);
        if(!selected) updateOptionSelected(2);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                    radius: 70,
                    backgroundColor: dataViewModel.characterViewModel.value.selectedStrain != null &&
                    removeDiacritics(dataViewModel.characterViewModel.value.selectedStrain!.name.toLowerCase().replaceAll(" ", "")) == 
                    removeDiacritics(strainDefinition.name.toLowerCase().replaceAll("/", "").replaceAll(" ", "")) ? 
                    detailColor : AppColors.gold,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          strainDefinition.avatarAssetPath,
                          width: 130,
                          height: 130,
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 8,),
                Text(
                  strainDefinition.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: 15,
                  fontFamily: 'Eremaeus',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 180,
            child: Text(
                    strainDefinition.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                    color: AppColors.darkBrown,
                    fontSize: 16,
                    fontFamily: 'Belleza',
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
import 'package:filhos_do_eden_personagem/app/model/character_type_definition.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view_model/data_view_model.dart';
import 'package:flutter/material.dart';

class TypeSelector extends StatelessWidget {
  final String iconAssetPath;
  final DataViewModel dataViewModel;
  final CharacterClassDefinition type;
  final bool selected;
  final bool upperSelection;
  final Function(int i, String s) updateDescription;
  final Function(int i) updateOptionSelected;
  const TypeSelector({super.key, required this.iconAssetPath, required this.dataViewModel, required this.type,
  required this.updateDescription, required this.updateOptionSelected, required this.selected, required this.upperSelection, });

  @override
  Widget build(BuildContext context) {
    Color detailColor = dataViewModel.characterViewModel.value.side 
    == LightAndDarkness.light ? AppColors.darkCelestialThemeColor : AppColors.darkInfernalThemeColor;

    return Column(
      spacing: 3,
            children: [
              IconButton(
                iconSize: 40,
                onPressed: () {
                  updateDescription(1, type.description);
                  if(dataViewModel.characterViewModel.value.type != type.type && upperSelection) updateOptionSelected(2);
                  dataViewModel.changeCharacter("", null, type.type, null);
                  if (!selected) updateOptionSelected(1);
                },
                icon: CircleAvatar(
                  radius: 30,
                  backgroundColor: dataViewModel.characterViewModel.value.type?.name != null && dataViewModel.characterViewModel.value.
                  type!.name.toLowerCase() == type.name.toLowerCase().replaceAll("/", "") ? detailColor : AppColors.gold,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        iconAssetPath,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Text(
                  type.name.toUpperCase().replaceAll("/", " - "),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: 15,
                  fontFamily: 'Eremaeus',
                  ),
                ),
              ),
            ],
          );
  }
}
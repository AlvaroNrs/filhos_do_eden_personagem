import 'package:filhos_do_eden_personagem/app/repository/power_catalog.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/buttons/custom_text_button.dart';
import 'package:filhos_do_eden_personagem/app/view_model/data_view_model.dart';
import 'package:flutter/material.dart';

class CharacterSheetPage extends StatefulWidget {
  final DataViewModel dataViewModel;
  final Function(int i) updateIndex;
  const CharacterSheetPage({super.key, required this.dataViewModel, required this.updateIndex});

  @override
  State<CharacterSheetPage> createState() => _CharacterSheetPageState();
}

class _CharacterSheetPageState extends State<CharacterSheetPage> {
  @override
  Widget build(BuildContext context) {
    List<String> skillBonusList = widget.dataViewModel.characterViewModel.value.classDefinition.
      skillsBonus.map((e) => "+${e.bonus} ${e.skill.name}").toList();
    List<String> powersList = widget.dataViewModel.characterViewModel.value.classDefinition.
      startPowers.map((e) => e.definition.name).toList();
    List<String> benefitsList = widget.dataViewModel.characterViewModel.value.classDefinition.
      benefits.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text(
            widget.dataViewModel.characterViewModel.value.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.darkBrown,
              fontSize: 26,
              fontFamily: 'Eremaeus',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: AppColors.gold,
                child: Image.asset(
                  widget.dataViewModel.characterViewModel.value.classDefinition.typeIconAssetPath,
                  width: 40,
                  height: 40,
                ),
              ),
              Text(
                widget.dataViewModel.characterViewModel.value.type!.name.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.darkBrown,
                  fontFamily: 'Eremaeus',
                  fontSize: 20,
                ),
              ),  
            ],
          ),
          Row(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: AppColors.gold,
                    child: Image.asset(
                      widget.dataViewModel.characterViewModel.value.strainDefinition.avatarAssetPath,
                      width: 120,
                      height: 120,
                    ),
                  ),
                  Text(
                    widget.dataViewModel.characterViewModel.value.strainDefinition.name.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.darkBrown,
                      fontFamily: 'Eremaeus',
                      fontSize: 16,
                    ),
                  ),  
                ],
              ),
              Expanded(
                child: Text(
                  widget.dataViewModel.characterViewModel.value.strainDefinition.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.darkBrown,
                    fontFamily: 'Belleza',
                    fontSize: 17,
                  ),
                ),
              ),  
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Column(
                  spacing: 5,
                  children: [
                    SheetSectionDetail(
                      title: "Habilidades",
                      side: widget.dataViewModel.characterViewModel.value.classDefinition.lightAndDarkness,
                      list: skillBonusList,
                    ),
                    SheetSectionDetail(
                      title: "Divindades",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextButton(
                text: "Voltar", 
                onPressed: () { 
                  widget.dataViewModel.changeThemeColor(null); 
                  widget.updateIndex(1);
                },
              ),
              CustomTextButton(text: "Editar", onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class SheetSectionDetail extends StatelessWidget {
  final String title;
  final List list;
  final LightAndDarkness side;
  const SheetSectionDetail({super.key, required this.title, required this.list, required this.side});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 10,
        children: [
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.darkBrown,
              fontFamily: 'Eremaeus',
              fontSize: 18,
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Desativa a rolagem própria do ListView
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle, 
                    size: 15, 
                    color: side == LightAndDarkness.light 
                        ? AppColors.darkCelestialThemeColor 
                        : AppColors.darkInfernalThemeColor,
                  ),
                  Text(
                    list[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.darkBrown,
                      fontFamily: 'Belleza',
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
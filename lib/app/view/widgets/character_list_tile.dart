import 'package:filhos_do_eden_personagem/app/model/character.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CharacterListTile extends StatelessWidget {
  final Character character;
  const CharacterListTile({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: AppColors.gold,
          width: 4
        ),
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.baseThemeColor,
            character.classDefinition.lightAndDarkness == LightAndDarkness.light ?
            AppColors.celestialThemeColor : AppColors.infernalThemeColor
          ]
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 15,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
            child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 10,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundColor: AppColors.gold,
                        child: Image.asset(
                            character.strainDefinition.avatarAssetPath,
                            width: 70,
                            height: 70,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(character.name.toUpperCase(),
                        style: TextStyle(
                          color: AppColors.darkBrown,
                          fontFamily: 'Eremaeus',
                          fontSize: 22,
                        ),
                      ),  
                      Row(
                        mainAxisAlignment: .start,
                        spacing: 5,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.gold,
                            child: Image.asset(
                              character.classDefinition.typeIconAssetPath,
                              width: 35,
                              height: 35,
                            ),
                          ),
                          Text(character.type.name.toUpperCase(),
                            style: TextStyle(
                              color: AppColors.darkBrown,
                              fontFamily: 'Eremaeus',
                              fontSize: 15,
                            ),
                          ),  
                        ],
                      ),
                      Text("Estirpe: ${character.strainDefinition.name}".toUpperCase(),
                        style: TextStyle(
                          color: AppColors.darkBrown,
                          fontFamily: 'Eremaeus',
                          fontSize: 15,
                        ),
                      ),  
                    ],
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
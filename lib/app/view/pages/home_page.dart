import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/buttons/circular_main_button.dart';
import 'package:filhos_do_eden_personagem/app/view_model/data_view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final DataViewModel dataViewModel;
  final Function(int i) updateIndex;
  const HomePage({super.key, required this.dataViewModel, required this.updateIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("Filhos do Éden".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
              color: AppColors.darkBrown,
              fontSize: 30,
              fontFamily: 'Eremaeus'
              ),
            ),
            Text("Criador de Personagem".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.darkBrown,
                fontSize: 20,
                fontFamily: 'Eremaeus'
              ),
            ),
          ]
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              CircularMainButton(text: "Novo Personagem", onPressed: (){ dataViewModel.resetGeneratedCharacter() ; updateIndex(3);},
                iconAssetPath: "assets/character.png", iconSize: 150, radius: 90),
              CircularMainButton(text: "Personagens Criados", onPressed: (){updateIndex(1);},
                iconAssetPath: "assets/sides.png", iconSize: 130, radius: 90),
            ],
          ),
        ),
      ],
    );
  }
}
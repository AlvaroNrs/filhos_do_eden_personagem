import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/buttons/circular_main_button.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/buttons/custom_text_button.dart';
import 'package:filhos_do_eden_personagem/app/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final ThemeViewModel themeViewModel;
  const HomePage({super.key, required this.themeViewModel});

  void updateTheme(){
    themeViewModel.changeThemeColor(AppColors.celestialThemeColor);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsetsGeometry.all(12),
          child: Column(
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
              SizedBox(height: 50,),
              CircularMainButton(text: "Novo Personagem", onPressed: (){},
              iconAssetPath: "assets/character.png", iconSize: 150, radius: 90),
              SizedBox(height: 40,),
              CircularMainButton(text: "Personagens Criados", onPressed: (){},
              iconAssetPath: "assets/sides.png", iconSize: 130, radius: 90),
              SizedBox(height: 20,)
              //CustomTextButton(text: "Trocar Tema", onPressed: updateTheme)
            ],
          ),
        ),
    );
  }
}
// IconButton(
//                 onPressed: () => closeModal(),
//                   icon: SvgPicture.asset(
//                   'assets/icons/Cancel_Dark.svg',
//                   width: 60,
//                   height: 60,
//                   ),
//                 ),
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
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
              TextButton(
                style: ButtonStyle(
                ),
                onPressed: updateTheme,
                child: Text("Trocar Tema".toUpperCase(),
                  style: TextStyle(fontFamily: 'Eremaeus'),
                )
              )
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
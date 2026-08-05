import 'package:filhos_do_eden_personagem/app/model/character.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/character_type.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';
import 'package:filhos_do_eden_personagem/app/view/pages/created_characters_page.dart';
import 'package:filhos_do_eden_personagem/app/view/pages/home_page.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';

class NavigatorStart extends StatefulWidget {
  const NavigatorStart({super.key});

  @override
  State<NavigatorStart> createState() => _NavigatorStartState();
}

class _NavigatorStartState extends State<NavigatorStart> {
  final themeViewModel = ThemeViewModel();
  int currentIndex = 0;
  List<Character> charactersList = [
    Character(id: "1", name: "Azrael", type: CharacterType.querubim,
      selectedStrain: Strain.legionario),
    Character(id: "2", name: "Meu Advogado", type: CharacterType.baal,
      selectedStrain: Strain.negociante),
  ];

  late final List<Widget> _pages = [
    HomePage(themeViewModel: themeViewModel, updateIndex: updateIndex),
    CreatedCharactersPage(updateIndex: updateIndex, charactersList: charactersList,)
  ];

  void updateIndex(int newIndex){
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Color>(
        // Escuta a propriedade que pertence ao ViewModel
        valueListenable: themeViewModel.themeViewColor,
        builder: (context, color, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  AppColors.baseThemeColor,
                  color,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: child,
          );
        },
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 12),
            child: _pages.elementAt(currentIndex),
          ),
        ),
      ),
    );
  }
}
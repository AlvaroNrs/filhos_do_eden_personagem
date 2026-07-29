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

  late final List<Widget> _pages = [
    HomePage(themeViewModel: themeViewModel),
  ];

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
        child: _pages.elementAt(currentIndex),
      ),
    );
  }
}
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';

class NavigatorStart extends StatefulWidget {
  const NavigatorStart({super.key});

  @override
  State<NavigatorStart> createState() => _NavigatorStartState();
}

class _NavigatorStartState extends State<NavigatorStart>{
  final themeViewModel = ThemeViewModel();
  final themeViewColor = ValueNotifier<Color>(AppColors.neutralThemeColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              AppColors.white,
              AppColors.lightGray
            ],
          begin: Alignment.topCenter)
        ),
      ),
    );
  }
}
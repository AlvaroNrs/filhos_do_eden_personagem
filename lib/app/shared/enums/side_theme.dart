import 'dart:ui';

import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';

enum SideTheme {
  light(lightColorSide: AppColors.celestialThemeColor, darkColorSide: AppColors.darkCelestialThemeColor),
  darkness(lightColorSide: AppColors.infernalThemeColor, darkColorSide: AppColors.darkInfernalThemeColor);
  
  const SideTheme({ required this.lightColorSide, required this.darkColorSide });

  final Color lightColorSide;
  final Color darkColorSide;
}
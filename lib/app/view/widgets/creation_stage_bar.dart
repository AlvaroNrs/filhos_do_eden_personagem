import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CreatorStageBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep; // Índice baseado em 0 (ex: 0, 1, 2, 3)
  final Color activeColor;
  final Color inactiveColor;
  final double circleSize;
  final double lineHeight;
  final Duration duration;

  const CreatorStageBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.activeColor = AppColors.gold, // Tom dourado/caqui da imagem
    this.inactiveColor = AppColors.lightGray, // Cinza claro
    this.circleSize = 44.0,
    this.lineHeight = 6.0,
    this.duration = const Duration(milliseconds: 350),
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < totalSteps; i++) {
      // A esfera fica ativa se o seu índice for menor ou igual ao estágio atual
      final bool isCircleActive = i <= currentStep;

      // 1. Adiciona a Esfera (Circle)
      children.add(
        AnimatedContainer(
          duration: duration,
          curve: Curves.easeInOut,
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            color: isCircleActive ? activeColor : inactiveColor,
            shape: BoxShape.circle,
          ),
        ),
      );

      // 2. Adiciona a Linha de Conexão (se não for o último elemento)
      if (i < totalSteps - 1) {
        // A linha entre 'i' e 'i+1' fica ativa se o estágio atual for maior que 'i'
        final bool isLineActive = i < currentStep;

        children.add(
          Expanded(
            child: Container(
              height: lineHeight,
              color: inactiveColor, // Fundo da linha inativa
              alignment: Alignment.centerLeft,
              child: AnimatedFractionallySizedBox(
                duration: duration,
                curve: Curves.easeInOut,
                widthFactor: isLineActive ? 1.0 : 0.0, // Preenche de 0% a 100%
                heightFactor: 1.0,
                child: Container(
                  color: activeColor, // Cor da linha ativa
                ),
              ),
            ),
          ),
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
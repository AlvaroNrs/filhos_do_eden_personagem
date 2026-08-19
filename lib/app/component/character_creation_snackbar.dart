import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String mensagem, required String iconPath,
  required Color backgroundColor}){
  SnackBar snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 5,
        children: [
          Image.asset(
            iconPath,
            width: 36,
            height: 36,
          ),
          Text(
            mensagem,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: "Belleza",
              fontSize: 18,
              color: AppColors.white
            ),
          )
        ]
      ),
      backgroundColor: backgroundColor
    );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
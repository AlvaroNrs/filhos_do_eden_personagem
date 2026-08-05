import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  const CustomTextButton({super.key, required this.text, required this.onPressed});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.darkBrown,
        padding: EdgeInsets.only(top: 12, bottom: 8, left: 20, right: 20),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.gold, width: 2),
            borderRadius: BorderRadius.circular(4),
        )
      ),
      onPressed: () =>  widget.onPressed(),
      child: Text(widget.text.toUpperCase(),
        style: TextStyle(
          color: AppColors.white,
          fontFamily: 'Eremaeus',
          fontSize: 16,
        ),        
      )
    );
  }
}
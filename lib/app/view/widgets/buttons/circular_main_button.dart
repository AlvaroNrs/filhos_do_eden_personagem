import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CircularMainButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final String iconAssetPath;
  final double iconSize;
  final double radius;
  const CircularMainButton({super.key, required this.text, required this.onPressed, required this.iconAssetPath,
  required this.iconSize, required this.radius});

  @override
  State<CircularMainButton> createState() => _CircularMainButtonState();
}

class _CircularMainButtonState extends State<CircularMainButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => widget.onPressed(),
          icon: CircleAvatar(
            radius: widget.radius+5,
            backgroundColor: AppColors.gold,
            child: CircleAvatar(
              backgroundColor: AppColors.darkBrown,
              radius: widget.radius,
              child: Image.asset(
                widget.iconAssetPath,
                width: widget.iconSize,
                height: widget.iconSize,
              ),
            ),
          ),
        ),
        SizedBox(height: 6),
        Text(widget.text.toUpperCase(),
          style: TextStyle(
            color: AppColors.darkBrown,
            fontFamily: 'Eremaeus',
            fontSize: 20,
          ),        
        )
      ],
    );
  }
}
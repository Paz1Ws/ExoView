import 'package:flutter/material.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:glowy_borders/glowy_borders.dart';

class PurpleButton extends StatelessWidget {
  final String text;
  final double? size;
  final GestureTapCallback onTap;
  const PurpleButton(
      {super.key, required this.text, required this.onTap, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedGradientBorder(
        animationTime: 5,
        borderSize: 1,
        glowSize: 0,
        borderRadius: BorderRadius.circular(6),
        gradientColors: [
          AppColors.purple,
          AppColors.softPurple,
        ],
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          color: AppColors.brightPurple,
          width: double.infinity,
          height: size ?? MediaQuery.of(context).size.height * 0.08,
          child: Center(
            child: Text(
              text,
              style: AppFonts.spaceGrotesk20,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

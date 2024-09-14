import 'package:flutter/material.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';

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
      child: Container(
        width: double.infinity,
        height: size ?? MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: AppColors.brightPurple,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(text, style: AppFonts.spaceGrotesk20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:glowy_borders/glowy_borders.dart';

class SearchTab extends StatelessWidget {
  final String text;
  final double? size;
  final GestureTapCallback onTap;
  const SearchTab(
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
            AppColors.dark,
            AppColors.lightGray,
          ],
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mic),
                suffixIcon: Icon(Icons.filter_alt),
                icon: Icon(Icons.search),
                hintText: 'Search...',
                hintStyle: AppFonts.spaceGrotesk16,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              style: AppFonts.spaceGrotesk16,
            ),
          )),
    );
  }
}

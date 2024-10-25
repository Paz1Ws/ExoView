import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/theme.dart';

class PlanetCategoryCard extends ConsumerWidget {
  // final String? model3D;
  final List<String> defaultPlanets = [
    'assets/images/planet_icons/planet_icon_1.png',
    'assets/images/planet_icons/planet_icon_2.png',
    'assets/images/planet_icons/planet_icon_3.png',
    'assets/images/planet_icons/planet_icon_4.png',
    'assets/images/planet_icons/planet_icon_5.png',
  ];
  final String exoplanetCategory;
  final void Function()? onTap;
  PlanetCategoryCard({
    required this.exoplanetCategory,
    required this.onTap,
    super.key,
    //this.model3D
  });

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.brightPurple,
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            )),
        child: Row(
          children: [
            ClipRect(
              child: Align(
                alignment: Alignment.centerRight,
                widthFactor: 0.3,
                child: Image.asset(
                  (defaultPlanets..shuffle()).first,
                  width: size.width * 0.5,
                  height: size.height,
                  fit: BoxFit.cover,
                  color: AppColors.veryDarkPurple,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  exoplanetCategory,
                  textAlign: TextAlign.center,
                  style: AppFonts.spaceGrotesk18.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class eXPLOr extends StatelessWidget {
  const eXPLOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GSD.2163.08.15.01.40',
          style: AppFonts.spaceGrotesk16,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'List of the 8 most famous exoplanets',
          style: AppFonts.spaceGrotesk12,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Exoplanet3DContainer(
              withTranslation: true,
              model: 'assets/animations/exoplanets/sun.glb',
            ),
            CurveOfExoplanets(),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Where do you want to go?',
              style: AppFonts.spaceGrotesk18,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Choose your cosmic journey',
              style: AppFonts.spaceGrotesk12.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

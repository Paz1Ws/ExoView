import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'dart:math';

class TouchableExoplanetCard extends StatelessWidget {
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

  TouchableExoplanetCard({
    required this.exoplanetCategory,
    required this.onTap,
    super.key,
    //this.model3D
  });

  @override
  Widget build(BuildContext context) {
    final random = Random();
    int maxFilledStars = random.nextInt(5) + 1;
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.brightPurple,
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              )),
          child: Column(children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                (defaultPlanets..shuffle()).first,
                fit: BoxFit.cover,
                color: AppColors.veryDarkPurple,
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < maxFilledStars ? Icons.star : Icons.star_border,
                        size: 16,
                        color: index < maxFilledStars
                            ? AppColors.brightTealGreen
                            : AppColors.veryDarkPurple,
                      );
                    }),
                  ),
                  Text(
                    exoplanetCategory,
                    textAlign: TextAlign.center,
                    style: AppFonts.spaceGrotesk16,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: AppColors.lightGray,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.bookmark),
                          iconSize: 16,
                          color: AppColors.brightTealGreen,
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 16,
                          icon: const Icon(FontAwesomeIcons.shareNodes),
                          color: AppColors.brightTealGreen,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ));
  }
}

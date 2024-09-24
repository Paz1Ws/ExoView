import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:glowy_borders/glowy_borders.dart';

class ExoplanetFeaturesCard extends StatelessWidget {
  final IconData featuresIcons;
  final String features;
  final String? featuresDescription;
  // final Exoplanet exoplanet;
  const ExoplanetFeaturesCard({
    required this.features,
    required this.featuresIcons,
    this.featuresDescription,
    // required this.exoplanet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBorder(
      borderSize: 1,
      stretchAlongAxis: true,
      animationTime: 3,
      animationProgress: 5,
      borderRadius: BorderRadius.circular(18),
      gradientColors: const [
        AppColors.dark,
        AppColors.veryLightGray,
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.veryDarkPurple,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        features,
                        maxLines: 2,
                        style: AppFonts.spaceGrotesk18.copyWith(
                          color: AppColors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      featuresIcons,
                      color: AppColors.grey,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  featuresDescription ?? 'FEATURE DESCRIPTION',
                  style: AppFonts.spaceGrotesk16,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:glowy_borders/glowy_borders.dart';

class ExoplanetFeaturesCard extends StatelessWidget {
  final IconData featuresIcons;
  final bool? isShip;
  final String features;
  final String featuresDescription;
  final String exoplanetFeaturesData;
  ExoplanetFeaturesCard({
    this.isShip,
    required this.features,
    required this.featuresIcons,
    required this.featuresDescription,
    required this.exoplanetFeaturesData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBorder(
      borderSize: 1,
      glowSize: 1,
      stretchAlongAxis: true,
      animationTime: 3,
      animationProgress: 5,
      borderRadius: BorderRadius.circular(18),
      gradientColors: const [
        AppColors.dark,
        AppColors.veryLightGray,
      ],
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.veryDarkPurple,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  features,
                  maxLines: 2,
                  style: AppFonts.spaceGrotesk16.copyWith(
                    color: AppColors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                featuresIcons,
                color: AppColors.grey,
                size: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Flexible widget to allow the child to be flexible within the available space
          Flexible(
            fit: FlexFit.loose,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final text = isShip!
                    ? featuresDescription
                    : featuresDescription + '\n' + exoplanetFeaturesData;
                final textStyle = AppFonts.spaceGrotesk16;

                // Function to calculate the appropriate text scale factor
                double calculateTextScaleFactor(
                    BoxConstraints constraints, String text, TextStyle style) {
                  final span = TextSpan(text: text, style: style);
                  final tp = TextPainter(
                    text: span,
                    maxLines: null,
                    textDirection: TextDirection.ltr,
                  )..layout(maxWidth: constraints.maxWidth);

                  // If the text height exceeds the available height, scale it down
                  if (tp.height > constraints.maxHeight) {
                    return constraints.maxHeight / tp.height * 0.9;
                  }
                  return 1.0;
                }

                // Calculate the scale factor based on the constraints and text
                final scaleFactor =
                    calculateTextScaleFactor(constraints, text, textStyle);

                return Text(
                  text,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.linear(scaleFactor),
                  style: textStyle,
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

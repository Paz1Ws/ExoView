import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';

class ExoplanetFeaturesCard extends StatelessWidget {
  final List<IconData> featuresIcons;
  final List<String> features;
  final List<String>? featuresDescription;
  // final Exoplanet exoplanet;
  ExoplanetFeaturesCard({
    required this.features,
    required this.featuresIcons,
    this.featuresDescription,
    // required this.exoplanet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 5,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.veryDarkPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: List.generate(
          features.length,
          (index) => Column(
            children: [
              Row(
                children: [
                  Text(
                    features[index],
                    style: AppFonts.spaceGrotesk12.copyWith(
                      color: AppColors.darkGray,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    featuresIcons[index],
                    color: AppColors.darkGray,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                featuresDescription?[index] ?? 'FEATURE DESCRIPTION',
                style: AppFonts.spaceGrotesk16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

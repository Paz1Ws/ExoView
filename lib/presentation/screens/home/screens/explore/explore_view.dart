import 'package:flutter/material.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExploreView extends StatelessWidget {
  List<String> exoplanetCategories = [
    'Super Earths',
    'Water Worlds'
        'Neptunian Planets',
    'Rocky Planets',
    'Gas Giants',
    'Ice Giants',
  ];
  ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SearchTab(),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Looking for a \nnew home?',
            style: AppFonts.spaceGrotesk40,
            textAlign: TextAlign.center,
          ),
          const PlanetCategoryCard(
            model3D: 'assets/animations/exoplanets/sun.glb',
          ),
        ],
      ),
    );
  }
}

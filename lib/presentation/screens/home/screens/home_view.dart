import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  final Widget curveOfExoplanets;

  const HomeView({super.key, required this.curveOfExoplanets});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GSD.2163.08.15.01.40',
                    style: AppFonts.spaceGrotesk16
                        .copyWith(color: AppColors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'List of the 7 most famous exoplanets',
                    style: AppFonts.spaceGrotesk12
                        .copyWith(color: AppColors.white),
                  ),
                  Text(
                    'Click one to see details',
                    style: AppFonts.spaceGrotesk12.copyWith(
                      color: AppColors.lightGray,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                CurveOfExoplanets(),
                Exoplanet3DContainer(
                  model: 'assets/animations/exoplanets/sun.glb',
                  exoplanet: Exoplanet(
                    planetName: 'Sun',
                    isControversial: false,
                    discoveryYear: 2023,
                    discoveryMethod: 'Transit',
                    orbitalPeriodDays: 365.25,
                    radiusEarthRadius: 1.0,
                    massEarthMass: 1.0,
                    equilibriumTemperature: 288,
                    density: 5.51,
                    transitDurationHours: 13.0,
                    insolationFlux: 1.0,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Where do you want to go?',
                    style: AppFonts.spaceGrotesk18
                        .copyWith(color: AppColors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Choose your cosmic journey',
                    style: AppFonts.spaceGrotesk12.copyWith(
                      color: AppColors.veryLightGray,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

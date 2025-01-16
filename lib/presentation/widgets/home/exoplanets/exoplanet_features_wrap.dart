import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/converters/exoplanet_feature_converter.dart';
import 'package:myapp/presentation/widgets/home/exoplanets/exoplanet_features_card.dart';

class ExoplanetFeaturesWrap extends StatelessWidget {
  final Exoplanet? exoplanet;
  final bool? isShip;

  ExoplanetFeaturesWrap({
    this.exoplanet,
    this.isShip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> exoplanetFeaturesData = [
      ExoplanetFeatureConverter.formatFeature(
          'Controversial Existence', exoplanet!.isControversial.toString()),
      ExoplanetFeatureConverter.formatFeature(
          'Discovery Year', exoplanet!.discoveryYear.toString()),
      ExoplanetFeatureConverter.formatFeature(
          'Discovery Method', exoplanet!.discoveryMethod),
      ExoplanetFeatureConverter.formatFeature(
          'Orbital Period (days)', exoplanet!.orbitalPeriodDays.toString()),
      ExoplanetFeatureConverter.formatFeature('Planet Radius (Earth radius)',
          exoplanet!.radiusEarthRadius.toString()),
      ExoplanetFeatureConverter.formatFeature(
          'Planet Mass (Earth masses)', exoplanet!.massEarthMass.toString()),
      ExoplanetFeatureConverter.formatFeature('Equilibrium Temperature (K)',
          exoplanet!.equilibriumTemperature.toString()),
      ExoplanetFeatureConverter.formatFeature(
          'Density (g/cm³)', exoplanet!.density.toString()),
      ExoplanetFeatureConverter.formatFeature('Transit Duration (hours)',
          exoplanet!.transitDurationHours.toString()),
      ExoplanetFeatureConverter.formatFeature('Insolation Flux (Earth fluxes)',
          exoplanet!.insolationFlux.toString()),
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: isShip == true
          ? shipFeatureData.features!.length
          : exoplanetFeatureData.features!.length,
      itemBuilder: (context, index) {
        return ExoplanetFeaturesCard(
          exoplanetFeaturesData:
              isShip == true ? null : exoplanetFeaturesData[index],
          features: isShip == true
              ? shipFeatureData.features![index]
              : exoplanetFeatureData.features![index],
          featuresDescription: isShip == true
              ? shipFeatureData.descriptions![index]
              : exoplanetFeatureData.descriptions![index],
          featuresIcons: isShip == true
              ? shipFeatureData.icons![index]
              : exoplanetFeatureData.icons![index],
        );
      },
    );
  }
}

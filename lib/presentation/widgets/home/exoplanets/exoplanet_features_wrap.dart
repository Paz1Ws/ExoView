import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/presentation/widgets/home/exoplanets/exoplanet_features_card.dart';

class ExoplanetFeaturesWrap extends StatelessWidget {
  final Exoplanet? exoplanet;
  final bool? isShip;

  ExoplanetFeaturesWrap({
    this.exoplanet,
    this.isShip,
    super.key,
  });

  String formatFeature(String feature, String value) {
    switch (feature) {
      case 'Controversial Existence':
        return value == 'true' ? 'Yes' : 'No';
      case 'Discovery Year':
        return value;
      case 'Discovery Method':
        return value;
      case 'Orbital Period (days)':
        return double.parse(value).toStringAsFixed(2);
      case 'Planet Radius (Earth radius)':
        return double.parse(value).toStringAsFixed(2);
      case 'Planet Mass (Earth masses)':
        return double.parse(value).toStringAsFixed(2);
      case 'Equilibrium Temperature (K)':
        return double.parse(value).toStringAsFixed(2);
      case 'Density (g/cm³)':
        return double.parse(value).toStringAsFixed(2);
      case 'Transit Duration (hours)':
        return double.parse(value).toStringAsFixed(2);
      case 'Insolation Flux (Earth fluxes)':
        return double.parse(value).toStringAsFixed(2);
      default:
        return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> exoplanetFeaturesData = [
      formatFeature(
          'Controversial Existence', exoplanet!.isControversial.toString()),
      formatFeature('Discovery Year', exoplanet!.discoveryYear.toString()),
      formatFeature('Discovery Method', exoplanet!.discoveryMethod),
      formatFeature(
          'Orbital Period (days)', exoplanet!.orbitalPeriodDays.toString()),
      formatFeature('Planet Radius (Earth radius)',
          exoplanet!.radiusEarthRadius.toString()),
      formatFeature(
          'Planet Mass (Earth masses)', exoplanet!.massEarthMass.toString()),
      formatFeature('Equilibrium Temperature (K)',
          exoplanet!.equilibriumTemperature.toString()),
      formatFeature('Density (g/cm³)', exoplanet!.density.toString()),
      formatFeature('Transit Duration (hours)',
          exoplanet!.transitDurationHours.toString()),
      formatFeature('Insolation Flux (Earth fluxes)',
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

class FeatureData {
  final List<IconData>? icons;
  final List<String>? features;
  final List<String>? descriptions;

  FeatureData({
    this.icons,
    this.features,
    this.descriptions,
  });
}

final FeatureData exoplanetFeatureData = FeatureData(
  icons: [
    FontAwesomeIcons.circleQuestion, // Controversial Existence
    FontAwesomeIcons.calendarDays, // Discovery Year
    FontAwesomeIcons.magnifyingGlass, // Discovery Method
    FontAwesomeIcons.clock, // Orbital Period (days)
    FontAwesomeIcons.rulerVertical, // Planet Radius (Earth radii)
    FontAwesomeIcons.weightScale, // Planet Mass (Earth masses)
    FontAwesomeIcons.temperatureHalf, // Equilibrium Temperature (K)
    FontAwesomeIcons.scaleBalanced, // Density (g/cm³)
    FontAwesomeIcons.hourglassHalf, // Transit Duration (hours)
    FontAwesomeIcons.solarPanel, // Insolation Flux (Earth fluxes)
  ],
  features: [
    'Controversial Existence',
    'Discovery Year',
    'Discovery Method',
    'Orbital Period (days)',
    'Planet Radius (Earth radius)',
    'Planet Mass (Earth masses)',
    'Equilibrium Temperature (K)',
    'Density (g/cm³)',
    'Transit Duration (hours)',
    'Insolation Flux (Earth fluxes)',
  ],
  descriptions: [
    'Existence debated among scientists? ',
    'Year in which the exoplanet was discovered: ',
    'Method used to discover the exoplanet: ',
    'Time to orbit around its star: ',
    'Radius of the exoplanet compared to Earth: ',
    'Mass of the exoplanet compared to Earth: ',
    'Equilibrium temperature of the exoplanet in Kelvin: ',
    'Density of the exoplanet in grams per cubic centimeter: ',
    'Duration of the transit of the exoplanet in hours: ',
    'Stellar energy received, compared with Earth: ',
  ],
);

final FeatureData shipFeatureData = FeatureData(
  icons: [
    FontAwesomeIcons.paintbrush,
    FontAwesomeIcons.rocket,
    FontAwesomeIcons.couch,
    FontAwesomeIcons.screwdriverWrench,
  ],
  features: [
    'Design',
    'Propulsion',
    'Interior',
    'Features',
  ],
  descriptions: [
    'Compact, streamlined craft with a quantum entanglement propulsion system.',
    'Leverages quantum tunneling for instantaneous travel between planets.',
    'Quantum shielding protects passengers from potential side effects of entanglement.',
    'Minimalistic interior, advanced navigation AI, observation windows for cosmic views.',
  ],
);

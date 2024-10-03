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

  @override
  Widget build(BuildContext context) {
    final List<String> exoplanetFeaturesData = [
      exoplanet!.isControversial.toString(),
      exoplanet!.discoveryYear.toString(),
      exoplanet!.discoveryMethod,
      exoplanet!.orbitalPeriodDays.toString(),
      exoplanet!.radiusEarthRadius.toString(),
      exoplanet!.massEarthMass.toString(),
      exoplanet!.equilibriumTemperature.toString(),
      exoplanet!.density.toString(),
      exoplanet!.transitDurationHours.toString(),
      exoplanet!.insolationFlux.toString(),
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
          exoplanetFeaturesData: exoplanetFeaturesData[index],
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
    'Planet Radius (Earth radii)',
    'Planet Mass (Earth masses)',
    'Equilibrium Temperature (K)',
    'Density (g/cm³)',
    'Transit Duration (hours)',
    'Insolation Flux (Earth fluxes)',
  ],
  descriptions: [
    'The existence of this exoplanet is debated among scientists?: ',
    'The year in which the exoplanet was discovered: ',
    'The method used to discover the exoplanet: ',
    'The time it takes for the exoplanet to complete one orbit around its star: ',
    'The radius of the exoplanet compared to Earth: ',
    'The mass of the exoplanet compared to Earth: ',
    'The equilibrium temperature of the exoplanet in Kelvin: ',
    'The density of the exoplanet in grams per cubic centimeter: ',
    'The duration of the transit of the exoplanet in hours: ',
    'The amount of stellar energy received by the exoplanet compared to Earth: ',
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

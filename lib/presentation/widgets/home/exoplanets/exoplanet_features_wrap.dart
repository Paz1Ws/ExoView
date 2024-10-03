import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/presentation/widgets/home/exoplanets/exoplanet_features_card.dart';

class ExoplanetFeaturesWrap extends StatelessWidget {
  final Exoplanet? exoplanet;
  final List<IconData> featuresIcons = [
    FontAwesomeIcons.magnifyingGlass,
    FontAwesomeIcons.clock,
    FontAwesomeIcons.globe,
    FontAwesomeIcons.weightScale,
  ];

  final List<String> features = [
    'Discovery method',
    'Orbital period',
    'Planet radius',
    'Planet mass',
  ];
  final List<String> featuresDescription = [
    'The method used to discover the exoplanet.',
    'The time it takes for the exoplanet to orbit its star.',
    'The size of the exoplanet compared to Earth.',
    'The mass of the exoplanet compared to Earth.',
  ];
  final List<String> shipFeatures = [
    'Desing',
    'Propulsion',
    'Interior',
    'Features'
  ];
  final List<IconData> shipFeaturesIcons = [
    FontAwesomeIcons.paintbrush,
    FontAwesomeIcons.rocket,
    FontAwesomeIcons.couch,
    FontAwesomeIcons.screwdriverWrench,
  ];
  final List<String> shipFeaturesDescription = [
    'Compact, streamlined craft with a quantum entanglement propulsion system.',
    'Leverages quantum tunneling for instantaneous travel between planets.',
    'Quantum shielding protects passengers from potential side effects of entanglement.',
    'Minimalistic interior, advanced navigation AI, observation windows for cosmic views.',
  ];
  final bool isShip;
  // final Exoplanet exoplanet;
  ExoplanetFeaturesWrap({
    this.exoplanet,
    this.isShip = false,
    super.key,
    // required this.exoplanet,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: isShip ? shipFeatures.length : features.length,
      itemBuilder: (context, index) {
        return ExoplanetFeaturesCard(
          exoplanet: exoplanet,
          features: isShip ? shipFeatures[index] : features[index],
          featuresDescription: isShip
              ? shipFeaturesDescription[index]
              : featuresDescription[index],
          featuresIcons:
              isShip ? shipFeaturesIcons[index] : featuresIcons[index],
        );
      },
    );
  }
}

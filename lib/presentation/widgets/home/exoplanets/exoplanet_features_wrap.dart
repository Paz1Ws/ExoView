import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/presentation/widgets/home/exoplanets/exoplanet_features_card.dart';

class ExoplanetFeaturesWrap extends StatelessWidget {
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
    this.isShip = false,
    super.key,
    // required this.exoplanet,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: isShip
          ? List.generate(
              shipFeatures.length,
              (index) => ExoplanetFeaturesCard(
                    features: shipFeatures,
                    featuresDescription: shipFeaturesDescription,
                    featuresIcons: shipFeaturesIcons,
                  ))
          : List.generate(
              features.length,
              (index) => ExoplanetFeaturesCard(
                    features: features,
                    featuresIcons: featuresIcons,
                  )),
    );
  }
}

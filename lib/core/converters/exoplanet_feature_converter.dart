// exoplanet_feature_converter.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExoplanetFeatureConverter {
  static String formatFeature(String feature, String value) {
    if (value == '0' || value == '0.0') {
      return 'Not Found';
    }
    switch (feature) {
      case 'Controversial Existence':
        return value == 'true' ? 'Yes' : 'No';
      case 'Discovery Year':
        return '$value';
      case 'Discovery Method':
        return value;
      case 'Orbital Period':
        double days = double.parse(value);
        if (days < 1) {
          return '${(days * 24).toStringAsFixed(1)} hours';
        }
        return '${days.toStringAsFixed(1)} days';
      case 'Planet Radius (Earth radius)':
        double radius = double.parse(value);
        return 'x${radius.toStringAsFixed(1)} Earth\'s size';
      case 'Planet Mass (Earth masses)':
        double mass = double.parse(value);
        return 'x${mass.toStringAsFixed(1)} Earth\'s mass';
      case 'Equilibrium Temperature (K)':
        double temp = double.parse(value);
        double celsius = temp - 273.15;
        return '${temp.toStringAsFixed(0)}K (${celsius.toStringAsFixed(0)}°C)';
      case 'Density (g/cm³)':
        double density = double.parse(value);
        if (density == 0) return 'Not Found';
        return '${density.toStringAsFixed(2)} g/cm³';
      case 'Transit Duration':
        return '${double.parse(value).toStringAsFixed(1)} hours';
      case 'Insolation Flux (Earth fluxes)':
        double flux = double.parse(value);
        return 'x${flux.toStringAsFixed(1)} Earth\'s radiation';
      default:
        return value;
    }
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

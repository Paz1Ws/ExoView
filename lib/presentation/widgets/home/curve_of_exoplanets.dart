import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myapp/core/data/models/exoplanet_model.dart';
import 'package:myapp/presentation/widgets/widgets.dart';
import 'package:myapp/presentation/screens/exoplanet/screens/exoplanet_or_ship_details.dart';

class CurveOfExoplanets extends StatelessWidget {
  final List<String> images = [
    'assets/animations/exoplanets/proxima_b.glb',
    'assets/animations/exoplanets/fire_Exoplanet.glb',
    'assets/animations/exoplanets/kepler_22_b.glb',
    'assets/animations/exoplanets/wasp_12_b.glb',
    'assets/animations/exoplanets/55_cancri.glb',
    'assets/animations/exoplanets/lunar_exoplanet.glb',
    'assets/animations/exoplanets/k1_18_b.glb',
  ];

  final List<Exoplanet> exoplanets = [
    Exoplanet(
      id: 1,
      planetName: 'Proxima b',
      isControversial: false,
      discoveryYear: 2016,
      discoveryMethod: 'Radial Velocity',
      orbitalPeriodDays: 11.2,
      radiusEarthRadius: 1.1,
      massEarthMass: 1.27,
      equilibriumTemperature: 234.0,
      density: 5.51,
      transitDurationHours: 2.0,
      insolationFlux: 0.65,
    ),
    Exoplanet(
      id: 2,
      planetName: 'WASP-49 b',
      isControversial: false,
      discoveryYear: 2012,
      discoveryMethod: 'Transit',
      orbitalPeriodDays: 2.7817,
      radiusEarthRadius: 13.428,
      massEarthMass: 126.81417,
      equilibriumTemperature: 1500.0,
      density: 3.9,
      transitDurationHours: 1.5,
      insolationFlux: 2.1,
    ),
    Exoplanet(
      id: 3,
      planetName: 'Kepler-22b',
      isControversial: false,
      discoveryYear: 2011,
      discoveryMethod: 'Transit',
      orbitalPeriodDays: 289.9,
      radiusEarthRadius: 2.4,
      massEarthMass: 5.0,
      equilibriumTemperature: 295.0,
      density: 5.5,
      transitDurationHours: 7.5,
      insolationFlux: 1.11,
    ),
    Exoplanet(
      id: 4,
      planetName: 'WASP-12b',
      isControversial: false,
      discoveryYear: 2008,
      discoveryMethod: 'Transit',
      orbitalPeriodDays: 1.1,
      radiusEarthRadius: 1.8,
      massEarthMass: 1.4,
      equilibriumTemperature: 1400.0,
      density: 0.288,
      transitDurationHours: 2.14,
      insolationFlux: 0.0,
    ),
    Exoplanet(
      id: 5,
      planetName: '55 Cancri e',
      isControversial: false,
      discoveryYear: 2004,
      discoveryMethod: 'Transit',
      orbitalPeriodDays: 0.7,
      radiusEarthRadius: 2.0,
      massEarthMass: 8.0,
      equilibriumTemperature: 2400.0,
      density: 6.0,
      transitDurationHours: 1.7,
      insolationFlux: 1.9,
    ),
    Exoplanet(
      id: 6,
      planetName: 'Kepler-1625 b',
      isControversial: false,
      discoveryYear: 2016,
      discoveryMethod: 'Transit',
      orbitalPeriodDays: 287.3789,
      radiusEarthRadius: 5.4,
      massEarthMass: 0.0,
      equilibriumTemperature: 253.0,
      density: 0,
      transitDurationHours: 18.886,
      insolationFlux: 0.97,
    ),
    Exoplanet(
      id: 7,
      planetName: 'K2-18b',
      isControversial: false,
      discoveryYear: 2015,
      discoveryMethod: 'Transit',
      orbitalPeriodDays: 33.0,
      radiusEarthRadius: 2.7,
      massEarthMass: 8.6,
      equilibriumTemperature: 265.0,
      density: 3.7,
      transitDurationHours: 2.0,
      insolationFlux: 1.4,
    ),
  ];

  CurveOfExoplanets({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final curveRadius = size.height / 3; // Adjust curve radius as needed

    return Stack(
      children: List.generate(7, (index) {
        // Calculate the angle for the current index
        double angle = (index / (images.length - 1)) * 1.52 * pi;

        // Adjust angle to match the desired curve shape (half-circle)
        angle = (angle - pi / 2) / 2;

        // Calculate the x and y positions based on the angle and curve radius
        double x = size.width / 2.5 + curveRadius * cos(angle);
        double y = size.height / 3 - curveRadius * sin(angle);

        return Positioned(
          left: x,
          top: y,
          child: Exoplanet3DContainer(
            height: size.height / 5,
            width: size.width / 5,
            translation: Matrix4.identity(),
            model: images[index],
            exoplanet: exoplanets[index],
          ),
        );
      }),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

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

  CurveOfExoplanets({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final curveRadius = size.height / 3; // Adjust curve radius as needed

    return Stack(
      children: List.generate(images.length, (index) {
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
          ),
        );
      }),
    );
  }
}

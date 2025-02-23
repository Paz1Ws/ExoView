import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:myapp/core/data/models/exoplanet_model.dart';
import 'package:myapp/presentation/screens/exoplanet/screens/exoplanet_or_ship_details.dart';

class Exoplanet3DContainer extends StatelessWidget {
  final String model;
  final double? height;
  final double? width;
  final Matrix4? translation;
  final Exoplanet exoplanet;

  const Exoplanet3DContainer({
    required this.model,
    this.translation,
    this.height,
    this.width,
    required this.exoplanet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: translation ?? Matrix4.identity()
        ..translate(-MediaQuery.sizeOf(context).width / 3, 0.0, 0.0),
      child: InkWell(
          onTap: () {
            if (model != "assets/animations/exoplanets/sun.glb")
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExoplanetOrShipDetails(
                    exoplanet: exoplanet,
                    model3D: model,
                  ),
                ),
              );
          },
          child: Container(
            height: height ?? MediaQuery.sizeOf(context).height,
            width: width ?? MediaQuery.sizeOf(context).width / 1.5,
            child: ClipOval(
              child: ModelViewer(
                backgroundColor: Colors.transparent,
                src: model,
                ar: false,
                disableTap: false,
                autoRotate: true, // Deshabilitar auto-rotate
                autoPlay: true, // Deshabilitar auto-play
                withCredentials: false,
                rotationPerSecond:
                    '0.05rad', // Ajustar la velocidad de rotación
                cameraControls: true, // Habilitar controles de cámara
                disableZoom: false,
                debugLogging: true, // Habilitar logging para depuración
              ),
            ),
          )),
    );
  }
}

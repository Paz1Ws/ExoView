import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Exoplanet3DContainer extends StatelessWidget {
  final bool withTranslation;
  final String model;
  final double? height;
  final double? width;
  const Exoplanet3DContainer({
    required this.withTranslation,
    required this.model,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(-MediaQuery.sizeOf(context).width / 2.5, 0.0, 0.0),
      child: Center(
        child: SizedBox(
          height: height ?? MediaQuery.sizeOf(context).height / 2,
          width: width ?? MediaQuery.sizeOf(context).width / 1.2,
          child: ModelViewer(
            backgroundColor: Colors.transparent,
            src: model,
            ar: false,
            autoRotate: true, // Deshabilitar auto-rotate
            autoPlay: true, // Deshabilitar auto-play
            withCredentials: false,
            rotationPerSecond: '0.1rad', // Ajustar la velocidad de rotación
            cameraControls: false, // Habilitar controles de cámara
            disableZoom: false,
            debugLogging: true, // Habilitar logging para depuración
          ),
        ),
      ),
    );
  }
}

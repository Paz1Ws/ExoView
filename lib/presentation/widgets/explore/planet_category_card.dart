import 'package:flutter/material.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class PlanetCategoryCard extends StatelessWidget {
  final String? model3D;
  const PlanetCategoryCard({super.key, this.model3D});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: double.infinity,
      color: AppColors.brightPurple,
      child: Row(
        children: [
          Exoplanet3DContainer(
            height: size.height * 0.1,
            width: size.width * 0.1,
            model: model3D!,
          ),
          const Center(
            child: Text('Exoplanet or Ship Details'),
          ),
        ],
      ),
    );
  }
}

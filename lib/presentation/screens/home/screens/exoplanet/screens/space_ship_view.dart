import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/data/data.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class SpaceShipView extends StatelessWidget {
  final String? model3D;
  const SpaceShipView({
    super.key,
    this.model3D,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Wrap(
            spacing: 10,
            children: [
              Exoplanet3DContainer(
                withTranslation: true,
                model: model3D!,
              ),
              Column(
                children: [
                  //RadialChart
                  Text('Max. Velocity', style: AppFonts.spaceGrotesk12),
                ],
              )
            ],
          )
        ],
      ),
      Row(
        children: [
          Text(
            'Nebula Voyager',
            style: AppFonts.spaceGrotesk18,
          ),
          WhiteBorderContainer(
            widget: Text(
              '2025',
              textAlign: TextAlign.center,
              style: AppFonts.spaceGrotesk18,
            ),
          )
        ],
      ),
      ExoplanetFeaturesWrap(
        isShip: true,
        // exoplanet: exoplanet,
      ),
      PurpleButton(text: 'Book ', onTap: () {}),
    ]);
  }
}

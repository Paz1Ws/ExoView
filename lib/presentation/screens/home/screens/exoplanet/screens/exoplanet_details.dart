import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/data/data.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExoplanetDetails extends StatelessWidget {
  final String? model3D;
  //final Exoplanet exoplanet;
  final List<String> defaultPlanets = [
    'assets/images/planet_icons/planet_icon_1.png',
    'assets/images/planet_icons/planet_icon_2.png',
    'assets/images/planet_icons/planet_icon_3.png',
    'assets/images/planet_icons/planet_icon_4.png',
    'assets/images/planet_icons/planet_icon_5.png',
  ];
  ExoplanetDetails({
    super.key,
    //  required this.exoplanet,
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
              model3D != null
                  ? Exoplanet3DContainer(
                      withTranslation: true,
                      model: model3D!,
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Image.asset(
                        (defaultPlanets..shuffle()).first,
                        fit: BoxFit.cover,
                      ),
                    ),
              //RadialChart
              Column(
                children: [
                  //RadialChart
                  Text('Average Temperature x more than Earth Average',
                      style: AppFonts.spaceGrotesk12),
                ],
              )
            ],
          )
        ],
      ),
      Row(
        children: [
          Text(
            'Exoplanet',
            style: AppFonts.spaceGrotesk18,
          ),
          WhiteBorderContainer(
            widget: Text(
              '1234',
              textAlign: TextAlign.center,
              style: AppFonts.spaceGrotesk18,
            ),
          )
        ],
      ),
      ExoplanetFeaturesWrap(
          // exoplanet: exoplanet,
          ),
      Row(
        children: [
          WhiteBorderContainer(
              widget: IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {},
          )),
          PurpleButton(text: 'Start Exploring', onTap: () {}),
          WhiteBorderContainer(
              widget: IconButton(
            icon: Icon(FontAwesomeIcons.arrowRight),
            onPressed: () {},
          ))
        ],
      ),
    ]);
  }
}

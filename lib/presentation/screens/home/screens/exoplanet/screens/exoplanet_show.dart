import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/data/data.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExoplanetShow extends StatelessWidget {
  final String nickName;
  final String name;
  final List<String> defaultPlanets = [
    'assets/images/planet_icons/planet_icon_1.png',
    'assets/images/planet_icons/planet_icon_2.png',
    'assets/images/planet_icons/planet_icon_3.png',
    'assets/images/planet_icons/planet_icon_4.png',
    'assets/images/planet_icons/planet_icon_5.png',
  ];
  //final Exoplanet exoplanet;
  final String? model3D;
  ExoplanetShow({
    super.key,
    required this.nickName,
    required this.name,
    this.model3D,
    //required this.exoplanet
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Image.asset(
              (defaultPlanets..shuffle()).first,
              width: size.width / 1.5,
              height: size.height / 1.5,
              color: AppColors.lightGray,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nickName,
                style: AppFonts.spaceGrotesk16.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                name,
                style: AppFonts.spaceGrotesk40,
              ),
              const SizedBox(
                height: 10,
              ),
              PurpleButton(text: 'Start Exploring', onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}

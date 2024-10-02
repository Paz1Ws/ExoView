import 'package:flutter/material.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExploreSectionDetails extends StatelessWidget {
  final String section;
  List<String> exoplanetCategories = [
    'Super Earths',
    'Water Worlds',
    'Neptunian Planets',
    'Rocky Planets',
    'Gas Giants',
    'Ice Giants',
  ];
  ExploreSectionDetails({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return PurpleBackground(
      withNavigation: false,
      withAppBar: true,
      appBarTitle: 'Explore',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Exoplanet3DContainer(
                    translation: Matrix4.identity()
                      ..translate(
                          -MediaQuery.sizeOf(context).width / 5, 0.0, 0.0),
                    model: 'assets/animations/exoplanets/sun.glb'),
                Positioned(
                  right: 20,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '$section\n+999 avalaibles',
                      style: AppFonts.spaceGrotesk40.copyWith(fontSize: 25),
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return TouchableExoplanetCard(
                      exoplanetCategory: exoplanetCategories[index],
                      onTap: () {});
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

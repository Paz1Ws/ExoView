import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExploreView extends StatelessWidget {
  List<String> exoplanetCategories = [
    'Super Earths',
    'Water Worlds',
    'Neptunian Planets',
    'Rocky Planets',
    'Gas Giants',
    'Ice Giants',
  ];
  ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SearchTab(),
            const SizedBox(
              height: 20,
            ),
            AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                TypewriterAnimatedText('Looking for a \nnew home?',
                    speed: const Duration(milliseconds: 200),
                    textAlign: TextAlign.center,
                    textStyle: AppFonts.spaceGrotesk40
                        .copyWith(fontWeight: FontWeight.normal)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return PlanetCategoryCard(
                    exoplanetCategory: exoplanetCategories[index],
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExploreSectionDetails(
                                section: exoplanetCategories[index],
                              )));
                    });
              },
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

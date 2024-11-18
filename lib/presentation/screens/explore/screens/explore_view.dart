import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExploreView extends StatelessWidget {
  final List<String> exoplanetCategories = [
    'All Exoplanets',
    'Super Earths',
    'Water Worlds',
    'Rocky Planets',
    'Gas Giants',
    'Neptunians',
  ];
  ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
<<<<<<< HEAD
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const SearchTab(),
          Spacer(),
          Divider(),
          Center(
            child: AnimatedTextKit(
              totalRepeatCount: 100,
              animatedTexts: [
                TypewriterAnimatedText('Looking for a new home?',
                    speed: const Duration(milliseconds: 200),
                    textAlign: TextAlign.center,
                    textStyle: AppFonts.spaceGrotesk40
                        .copyWith(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          Divider(),
          Spacer(),
        ],
=======
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SearchTab(),
            Center(
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText('Looking for a new home?',
                      speed: const Duration(milliseconds: 200),
                      textAlign: TextAlign.center,
                      textStyle: AppFonts.spaceGrotesk40
                          .copyWith(fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ],
        ),
>>>>>>> 275d990a493e835dbb2845d7f98a93b0c1d820ec
      ),
    );
  }
}

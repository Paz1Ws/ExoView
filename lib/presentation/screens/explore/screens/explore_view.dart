import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/screens.dart';
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
                TypewriterAnimatedText('Looking for a new home?',
                    speed: const Duration(milliseconds: 200),
                    textAlign: TextAlign.center,
                    textStyle: AppFonts.spaceGrotesk40
                        .copyWith(fontWeight: FontWeight.normal)),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
              child: Image.asset('assets/images/ask_to_ai.png'),
            )
          ],
        ),
      ),
    );
  }
}

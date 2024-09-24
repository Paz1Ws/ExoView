import 'dart:async';

import 'package:animate_do/animate_do.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/presentation/screens/screens.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 4000), (_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => FadeIn(child: const WelcomeScreen())),
      );
      _timer.cancel();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/planet_loader_animation.json',
              height: size.height / 2,

              width: size.width / 2,

              frameRate: const FrameRate(60), // Adjust the frame rate as needed
            ),
            Transform(
              transform: Matrix4.translationValues(-30, 0, 0),
              child: FadeInUp(
                curve: Curves.easeInOutSine,
                from: 10,
                duration: const Duration(milliseconds: 4000),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  repeatForever: false,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'ExoView',
                      colors: [
                        AppColors.white,
                        AppColors.brightPurple,
                        AppColors.brightTealGreen
                      ],
                      textStyle: AppFonts.spaceMono40
                          .copyWith(fontWeight: FontWeight.w800),
                      speed: const Duration(milliseconds: 800),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

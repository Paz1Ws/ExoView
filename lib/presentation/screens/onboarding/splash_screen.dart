import 'dart:async';

import 'package:animate_do/animate_do.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
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

    ref.read(getRemoteExoplanetsToSaveProviderCaller);

    ref.read(themeProvider.notifier).setDarkMode();
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
              child: FittedBox(
                fit: BoxFit.scaleDown,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

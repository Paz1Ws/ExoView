import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    Future.delayed(Duration(seconds: 2), () {
      // Navigator.pushNamed(context, '/home');
    });
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: AppColors.dark,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Lottie.asset(
                  'assets/animations/planet_loader_animation.json',
                  height: size.height / 2,
                  width: size.width / 2),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: FadeInLeft(
                curve: Curves.easeInOutSine,
                from: 150,
                duration: Duration(milliseconds: 1000),
                child: Text('ExoView',
                    style: AppFonts.heading1.copyWith(
                        color: AppColors.veryLightGray,
                        fontWeight: FontWeight.normal)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

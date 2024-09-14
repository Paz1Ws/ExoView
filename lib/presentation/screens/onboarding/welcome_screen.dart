import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/presentation/screens/auth/screens/login/login_screen.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BackgroundWithImage(
      backgroundIndex: 0,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                TypewriterAnimatedText('Welcome to ExoView',
                    speed: const Duration(milliseconds: 200),
                    textStyle: AppFonts.spaceGrotesk40
                        .copyWith(fontWeight: FontWeight.normal)),
              ],
            ),
            const SizedBox(height: 20),
            Text(
                'Revolutionize the way you see the stars, go beyond the limits',
                style: AppFonts.spaceGrotesk20
                    .copyWith(color: AppColors.lightGray)),
            SizedBox(height: size.height * 0.1),
            PurpleButton(
              text: 'Tap to Launch',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        FadeInLeft(child: const LoginScreen())));
              },
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWithImage(
      backgroundIndex: 3,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              'Forgot',
              style: AppFonts.spaceGrotesk40,
            ),
            Text(
              'Password?',
              style: AppFonts.spaceGrotesk60,
            ),
            Text(
              'Where would you like to receive a Verification Code ?',
              style: AppFonts.spaceGrotesk18,
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RestorePasswordMethod(
                    icon: FontAwesomeIcons.commentSms,
                    text: 'SMS',
                  ),
                  RestorePasswordMethod(
                    icon: FontAwesomeIcons.envelope,
                    text: 'Email',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            PurpleButton(
                text: 'Next',
                onTap: () {
                  null;
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

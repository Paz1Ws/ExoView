import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/auth/screens/signUp/signup_controller.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers =
        List.generate(5, (_) => TextEditingController());
    final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

    return SignUpBackground(
        body: Column(
      children: [
        Text(
          'We have sent a verification code to your email address. Please enter the code below.',
          textAlign: TextAlign.center,
          style: AppFonts.spaceGrotesk18,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return VerifyEmailContainer(
              controller: controllers[index],
              focusNode: focusNodes[index],
              nextFocusNode: index < 4 ? focusNodes[index + 1] : null,
              previousFocusNode: index > 0 ? focusNodes[index - 1] : null,
            );
          }),
        ),
        const SizedBox(
          height: 10,
        ),
        PurpleButton(
          text: 'Verify Email',
          onTap: () {},
        ),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('Wrong email?',
                style: AppFonts.spaceGrotesk16
                    .copyWith(color: AppColors.lightGray)),
            TextButton(
                onPressed: () {
                  Navigator.of(context).maybePop(MaterialPageRoute(
                      builder: (context) =>
                          FadeOut(child: const SignUpController())));
                },
                child: Text(
                  'Try again here',
                  style: AppFonts.spaceGrotesk16
                      .copyWith(color: AppColors.brightTealGreen),
                )),
          ],
        )
      ],
    ));
  }
}

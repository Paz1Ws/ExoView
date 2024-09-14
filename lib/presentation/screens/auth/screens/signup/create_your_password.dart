import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class CreateYourPassword extends StatelessWidget {
  final bool? recoverPassword;
  const CreateYourPassword({super.key, this.recoverPassword = false});

  @override
  Widget build(BuildContext context) {
    return SignUpBackground(
        body: Column(
      children: [
        const WritingLabel(
          labelText: 'Create your password',
          withVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        WritingLabel(
          labelText:
              recoverPassword! ? 'Recover your password' : 'Confirm password',
          withVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        PurpleButton(
          text: 'Create Account',
          onTap: () {
            recoverPassword!
                ? showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: AppColors.white,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                                'assets/images/password_recovered.webp'),
                            const SizedBox(height: 10),
                            Text(
                              'Congrulations!',
                              style: AppFonts.spaceGrotesk20.copyWith(
                                  color: AppColors.veryDarkPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'OK, password succesful reseted, you\'ll be redirected to login screen now.',
                              textAlign: TextAlign.center,
                              style: AppFonts.spaceGrotesk16
                                  .copyWith(color: AppColors.darkGray),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SuccesfulAccountCreation()));
          },
        )
      ],
    ));
  }
}

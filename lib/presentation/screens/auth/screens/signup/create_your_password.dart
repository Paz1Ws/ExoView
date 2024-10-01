import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/core/domain/usecases/sign_up.dart';
import 'package:myapp/presentation/screens/auth/providers/auth_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class CreateYourPassword extends ConsumerWidget {
  final bool? recoverPassword;

  final void Function() _onItemTapped;
  const CreateYourPassword(
      {super.key,
      this.recoverPassword = false,
      required void Function() onItemTapped})
      : _onItemTapped = onItemTapped;

  @override
  Widget build(BuildContext context, ref) {
    final signUpUseCase = ref.watch(signUpUseCaseProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final verifyPasswordController =
        ref.watch(verifyPasswordControllerProvider);

    void showPasswordMismatchAlert(BuildContext context) {
      showDialog(
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
                const SizedBox(height: 10),
                Text(
                  'Passwords do not match!',
                  style: AppFonts.spaceGrotesk20.copyWith(
                      color: AppColors.veryDarkPurple,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Please make sure both passwords are the same.',
                  textAlign: TextAlign.center,
                  style: AppFonts.spaceGrotesk16
                      .copyWith(color: AppColors.darkGray),
                ),
              ],
            ),
          );
        },
      );
    }

    bool arePasswordsMatching() {
      return passwordController.text == verifyPasswordController.text;
    }

    return SignUpBackground(
        body: Column(
      children: [
        WritingLabel(
          controller: passwordController,
          labelText: 'Create your password',
          withVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        WritingLabel(
          controller: verifyPasswordController,
          labelText:
              recoverPassword! ? 'Recover your password' : 'Confirm password',
          withVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        PurpleButton(
          text: 'Create Account',
          onTap: () async {
            if (recoverPassword!) {
              showDialog(
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
                        Image.asset('assets/images/password_recovered.webp'),
                        const SizedBox(height: 10),
                        Text(
                          'Congratulations!',
                          style: AppFonts.spaceGrotesk20.copyWith(
                              color: AppColors.veryDarkPurple,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'OK, password successfully reset, you\'ll be redirected to login screen now.',
                          textAlign: TextAlign.center,
                          style: AppFonts.spaceGrotesk16
                              .copyWith(color: AppColors.darkGray),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              if (!arePasswordsMatching()) {
                showPasswordMismatchAlert(context);
                return;
              }

              final email = ref.read(emailControllerProvider).text;
              final password = ref.read(passwordControllerProvider).text;
              final name = ref.read(nameControllerProvider).text;

              await signUpUseCase(SignUpParams(
                email: email,
                password: password,
                name: name,
              ));
              _onItemTapped();
            }
          },
        )
      ],
    ));
  }
}

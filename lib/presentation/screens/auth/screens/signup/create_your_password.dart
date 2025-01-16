import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/core/domain/usecases/auth/sign_up.dart';
import 'package:myapp/presentation/screens/auth/providers/auth_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';
import 'package:myapp/config/util/validation_utils.dart';

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
    final email = ref.watch(emailControllerProvider).text;
    final name = ref.watch(nameControllerProvider).text;
    final verifyPasswordController =
        ref.watch(verifyPasswordControllerProvider);
    bool arePasswordsMatching() {
      return ValidationUtils.arePasswordsMatching(
          passwordController.text, verifyPasswordController.text);
    }

    void validateAndProceed() async {
      final box = await Hive.openBox('credentialsBox');

      if (!arePasswordsMatching()) {
        ValidationUtils.showPasswordMismatchAlert(context);
        return;
      }

      if (passwordController.text.isNotEmpty &&
          verifyPasswordController.text.isNotEmpty) {
        if (passwordController.text.length < 6) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Password must be at least 6 characters long')),
          );
          return;
        }
        await signUpUseCase(SignUpParams(
          email: email,
          password: passwordController.text,
          name: name,
        ));
        await box.put('name', name);
        _onItemTapped();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill in both password fields')),
        );
      }
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
          onTap: validateAndProceed,
        )
      ],
    ));
  }
}

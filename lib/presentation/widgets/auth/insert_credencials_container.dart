import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';
import '../../screens/auth/providers/auth_providers.dart';
import '../../screens/home/screens/home_view_controller.dart';

class InsertCredencialsContainer extends ConsumerWidget {
  const InsertCredencialsContainer({super.key});

  @override
  Widget build(BuildContext context, ref) {
   // final signInUseCase = ref.watch(signInUseCaseProvider);
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          WritingLabel(labelText: 'Email', controller: emailController),
          const SizedBox(height: 10),
          WritingLabel(
            labelText: 'Password',
            controller: passwordController,
            withVisibility: true,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PasswordResetController()));
              },
              child: Text(
                'Recover password?',
                style: AppFonts.spaceGrotesk16.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          PurpleButton(
            text: 'Login',
            onTap: () async {
              final email = ref.read(emailControllerProvider).text;
              final password = ref.read(passwordControllerProvider).text;
              // final response = await signInUseCase(SignInParams(
              //   email: email,
              //   password: password,
              // ));

              // print(response);
            },
          ),
        ],
      ),
    );
  }
}

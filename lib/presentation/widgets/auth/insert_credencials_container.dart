import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:myapp/presentation/screens/home/screens/home_view_controller.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';
import 'package:hive/hive.dart'; // Import Hive package

import '../../screens/auth/providers/auth_providers.dart';

class InsertCredencialsContainer extends ConsumerWidget {
  const InsertCredencialsContainer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final signInUseCase = ref.watch(signInUseCaseProvider);
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);

    return FutureBuilder(
      future: Hive.openBox('credentialsBox'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text('Error opening box: ${snapshot.error}'));
          } else {
            // Recuperar credenciales guardadas
            final box = Hive.box('credentialsBox');
            final savedEmail = box.get('email', defaultValue: '');
            final savedPassword = box.get('password', defaultValue: '');
            emailController.text = savedEmail;
            passwordController.text = savedPassword;

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
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: GestureDetector(
                  //     onTap: () async {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (context) =>
                  //               const PasswordResetController()));
                  //     },
                  //     child: Text(
                  //       'Recover password?',
                  //       style: AppFonts.spaceGrotesk16.copyWith(
                  //         color: AppColors.lightGray,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  PurpleButton(
                    text: 'Login',
                    onTap: () async {
                      final email = ref.read(emailControllerProvider).text;
                      final password =
                          ref.read(passwordControllerProvider).text;
                      final response = await signInUseCase(SignInParams(
                        email: email,
                        password: password,
                      ));
                      if (response.isRight()) {
                        // Guardar credenciales en el box
                        await box.put('email', email);
                        await box.put(
                            'name', response.fold((l) => null, (r) => r.name));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HomeViewController()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              response.fold(
                                (failure) => failure.message,
                                (success) => success.toString(),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

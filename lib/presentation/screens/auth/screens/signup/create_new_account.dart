import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWithImage(
        backgroundIndex: 1,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Text(
                    'Begin with creating new free account.\nThe first step to your journey.',
                    textAlign: TextAlign.center,
                    style: AppFonts.spaceGrotesk20
                        .copyWith(color: AppColors.lightGray),
                  ),
                  const Spacer(),
                  PurpleButton(
                    text: 'Sign up with email',
                    size: MediaQuery.of(context).size.height * 0.08,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpController()));
                    },
                  ),
                  const Spacer(),
                  const SizedBox(height: 15),
                  const AuthMethodLarge(
                    image: 'assets/images/google.webp',
                  ),
                  const SizedBox(height: 15),
                  const AuthMethodLarge(
                    image: 'assets/images/apple.webp',
                  ),
                  const SizedBox(height: 15),
                  const AuthMethodLarge(
                    image: 'assets/images/facebook.webp',
                  ),
                  const Spacer(),
                  Text(
                      'By using ExoView, you agree to our Terms of Service and Privacy Policy',
                      textAlign: TextAlign.center,
                      style: AppFonts.spaceGrotesk16
                          .copyWith(color: AppColors.lightGray)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ));
  }
}

class AuthMethodLarge extends StatelessWidget {
  final String image;

  const AuthMethodLarge({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => const SignUpWithEmail()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.veryLightGray,
        ),
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                'Continue with Google',
                style: AppFonts.spaceGrotesk16.copyWith(color: AppColors.dark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
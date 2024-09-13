import 'package:flutter/material.dart';

class AuthMethods extends StatelessWidget {
  const AuthMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthMethodButton(
          methodImage: 'assets/images/google.webp',
        ),
        SizedBox(width: 25),
        AuthMethodButton(
          methodImage: 'assets/images/facebook.webp',
        ),
        SizedBox(width: 25),
        AuthMethodButton(
          methodImage: 'assets/images/apple.webp',
        ),
      ],
    );
  }
}

class AuthMethodButton extends StatelessWidget {
  final String methodImage;
  const AuthMethodButton({super.key, required this.methodImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(methodImage, height: 50, width: 80),
    );
  }
}
